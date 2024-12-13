module TerminalColors
  module Apply
    def self.call(text, fg: nil, bg: nil, bold: nil)
      styled_text = String.new

      styled = fg || bg || bold

      if styled
        styled_text << "\e["

        if bold
          styled_text << '1'
        end

        if fg
          if not styled_text.end_with?('[')
            styled_text << ';'
          end

          fg = Color.get(fg)
          styled_text << "3#{fg}"
        end

        if bg
          if not styled_text.end_with?('[')
            styled_text << ';'
          end

          bg = Color.get(bg)

          styled_text << "4#{bg}"
        end

        styled_text << 'm'
      end

      styled_text << text

      if styled
        styled_text << "\e[m"
      end

      styled_text
    end
  end
end
