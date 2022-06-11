{ ... }:

{
  programs.discocss = {
    enable = true;
    discordAlias = true;
    css = ''
      /**
      * @name Catppuccin
      * @author Catppuccin
      * @version 0.0.8
      * @description 🎮 Soothing pastel theme for Discord
      * @website https://github.com/catppuccin
      * @source https://github.com/catppuccin/discord
      **/

      :root {
        /*                 H     S     L */
        --rosewater_hsl:  10,  56%,  91%;
        --flamingo_hsl:    0,  59%,  88%;
        --mauve_hsl:     279,  70%,  83%;
        --pink_hsl:      316,  72%,  86%;
        --maroon_hsl:    349,  60%,  77%;
        --red_hsl:       342,  79%,  75%;
        --peach_hsl:      24,  88%,  78%;
        --yellow_hsl:     41,  88%,  84%;
        --green_hsl:     128,  58%,  79%;
        --teal_hsl:      171,  53%,  81%;
        --blue_hsl:      207,  93%,  79%;
        --sky_hsl:       189,  71%,  73%;
        --lavender_hsl:  238, 100%,  89%;
        --black0_hsl:    254,  25%,  10%;
        --black1_hsl:    249,  23%,  12%;
        --black2_hsl:    240,  21%,  15%;
        --black3_hsl:    249,  18%,  22%;
        --black4_hsl:    254,  12%,  36%;
        --gray0_hsl:     247,   8%,  46%;
        --gray1_hsl:     274,  11%,  59%;
        --gray2_hsl:     285,  10%,  75%;
        --white_hsl:     220,  38%,  89%;
      }

      :root {
        --rosewater: hsl(var(--rosewater_hsl));
        --flamingo: hsl(var(--flamingo_hsl));
        --mauve: hsl(var(--mauve_hsl));
        --pink: hsl(var(--pink_hsl));
        --maroon: hsl(var(--maroon_hsl));
        --red: hsl(var(--red_hsl));
        --peach: hsl(var(--peach_hsl));
        --yellow: hsl(var(--yellow_hsl));
        --green: hsl(var(--green_hsl));
        --teal: hsl(var(--teal_hsl));
        --blue: hsl(var(--blue_hsl));
        --sky: hsl(var(--sky_hsl));
        --lavender: hsl(var(--lavender_hsl));
        --black0: hsl(var(--black0_hsl));
        --black1: hsl(var(--black1_hsl));
        --black2: hsl(var(--black2_hsl));
        --black3: hsl(var(--black3_hsl));
        --black4: hsl(var(--black4_hsl));
        --gray0: hsl(var(--gray0_hsl));
        --gray1: hsl(var(--gray1_hsl));
        --gray2: hsl(var(--gray2_hsl));
        --white: hsl(var(--white_hsl));
        --mauve-o10: hsl(var(--mauve_hsl), .1);
        --pink-o20: hsl(var(--pink_hsl), .2);
      }

      .theme-dark {
        --header-primary: var(--white) !important;
        --header-secondary: var(--rosewater) !important;
        --background-primary: var(--black2) !important;
        --background-primary-alt: var(--black2) !important;
        --background-mobile-primary: var(--black2) !important;
        --background-secondary: var(--black1) !important;
        --background-secondary-alt: var(--black1) !important;
        --background-mobile-secondary: var(--black1) !important;
        --background-tertiary: var(--black0) !important;
        --background-floating: var(--black2) !important;
        --background-mentioned: var(--mauve-o10) !important;
        --background-mentioned-hover: var(--pink-o20) !important;
        --background-accent: var(--gray0) !important;
        --background-modifier-selected: var(--black2) !important;
        --background-modifier-accent: var(--black2) !important;
        --background-modifier-hover: var(--black3) !important;
        --text-normal: var(--white) !important;
        --text-muted: var(--gray0) !important;
        --text-link: var(--sky) !important;
        --channels-default: var(--gray0) !important;
        --channeltextarea-background: var(--black3) !important;
        --activity-card-background: var(--black2) !important;
        --interactive-normal: var(--white) !important;
        --interactive-muted: var(--black3) !important;
        --interactive-hover: var(--gray2) !important;
        --interactive-active: var(--rosewater) !important;
        --scrollbar-thin-thumb: var(--black0) !important;
        --scrollbar-thin-track: transparent !important;
        --scrollbar-auto-thumb: var(--black0) !important;
        --scrollbar-auto-track: var(--black3) !important;
        --scrollbar-auto-scrollbar-color-thumb: var(--black1) !important;
        --scrollbar-auto-scrollbar-color-track: var(--black3) !important;
        --deprecated-store-bg: var(--black0) !important;
        --input-background: var(--black3) !important;
      }

      /* Mentions */
      .mentioned-Tre-dv .mention.interactive {
        color: var(--white) !important;
      }

      .mentioned-Tre-dv::before {
        background-color: var(--white) !important;
      }

      /* Home */
      .container-2cd8Mz {
        background-color: var(--black2) !important;
      }

      /* Autocomplete popup */
      .autocomplete-3NRXG8 {
        background-color: var(--black2) !important;
      }

      .wrapper-1NNaWG.categoryHeader-OpJ1Ly {
        background-color: var(--black2) !important;
      }

      .autocomplete-3NRXG8 {
        background-color: var(--black2) !important;
      }

      /* Autocomplete popup selection */
      .selected-3H3-RC {
        background-color: var(--black3) !important;
      }

      /* Search: Items */
      .container-2McqkF {
        background-color: var(--black0) !important;
      }

      .searchOption-351dTI:hover {
        background-color: var(--black3) !important;
      }

      /* Search: No shadows */
      .option-ayUoaq:after {
        background: none !important;
      }

      /* Search: in-section */
      .queryContainer-ZunrLZ {
        background-color: var(--black0) !important;
      }

      /* Search: History */
      .option-ayUoaq:hover {
        background-color: var(--black3) !important;
      }

      /* Search: Little Icon Thingy */
      .searchFilter-2UfsDk,
      .searchAnswer-23w-CH {
        background-color: var(--black3) !important;
      }

      /* IN ORDER: New-Unreads-Btn,jumpToPresentBar,CTRL+K */
      .bar-2eAyLE,.jumpToPresentBar-1cEnH0,.input-3r5zZY {
        background-color: var(--gray0) !important;
      }

      /* New Message Bar */
      .newMessagesBar-1hF-9G:before {
        content: "";
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: var(--gray0) !important;
        border-radius:0 0 3px 3px;
      }

      /* New Messages Flag */
      .isUnread-3Lojb- {
        border-color: var(--gray0) !important;
      }

      .unreadPill-3nEWYM {
        background-color: var(--gray0) !important;
      }

      .unreadPillCapStroke-1nE1Q8 {
        fill: var(--gray0) !important;
        color: var(--gray0) !important;
      }

      .isUnread-3Lojb- .content-3spvdd {
        color: var(--gray0) !important;
      }

      /* Server Modals */
      .root-g14mjS,
      .separator-2lLxgC {
        background-color: var(--black2) !important;
      }

      .footer-31IekZ {
        background-color: var(--black1) !important;
      }

      /* Boost Page */
      .perksModal-CLcR1c {
        background-color: var(--black1) !important;
      }

      .tierMarkerBackground-G8FoN4 {
        background-color: var(--black2) !important;
      }

      /* Emoji Popout */
      .popoutContainer-2wbmiM {
        background-color: var(--black1) !important;
      }

      /* Presence Buttons */
      .lookFilled-yCfaCM.colorGrey-2iAG-B,
      .lookFilled-yCfaCM.colorPrimary-2AuQVo {
        background-color: var(--black3) !important;
      }

      /* Primary Card */
      .cardPrimary-3qRT__ {
        background-color: var(--black1) !important;
      }

      /* Payment Page Boxes */
      .paymentPane-ut5qKZ,
      .paginator-1eqD2g,
      .payment-2bOh4k,
      .codeRedemptionRedirect-3SBiCp {
        background-color: var(--black1) !important;
      }

      .bottomDivider-ZmTm-j {
        border-bottom-color: var(--black2) !important;
      }

      /* Spotify Invite */
      .invite-3uuHYQ {
        background-color: var(--black1) !important;
      }

      /* Edit Attachment */
      .footer-VCsJQY {
        background-color: var(--black1) !important;
      }

      /* Spoilers */
      .spoilerText-27bIiA.hidden-3B-Rum,
      .inlineContent-2YnoDy {
        background-color: var(--black3) !important;
      }

      /* Stream Preview */
      .streamPreview-I7itZ6 {
        background-color: var(--black2) !important;
      }

      /* Selection */
      ::-moz-selection {
        color: var(--white) !important;
        background: var(--black4) !important;
      }

      ::selection {
        color: var(--white) !important;
        background: var(--black4) !important;
      }

      /* Delete Message Confirmation */
      .message-G6O-Wv {
        background-color: var(--black2) !important;
        box-shadow: 0 0 0 1px hsla(var(--black3_hsl), 0.6), 0 2px 10px 0 hsla(var(--black3_hsl), 0.1) !important;
      }

      /* Command Option */
      .pill-1HLSrc,
      .optionKey-1tfFt_ {
        background-color: var(--black2) !important;
      }

      /* Volume Slider */
      .tooltipContent-Nejnvh {
        background-color: var(--black2) !important;
      }

      .grabber-2GQyvM {
        background-color: var(--white) !important;
      }

      .bar-1Bhnl9 {
        background-color: var(--gray0) !important;
      }

      .tooltipPointer-3L49xb {
        border-top-color: var(--black2) !important;
      }

      /* Call Page */
      .tile-2TcwiO {
        background-color: var(--black0) !important;
      }

      .button-3Vyz67 {
        background-color: var(--black2) !important;
      }

      .buttonColor-28DXIe,
      .colorable-3rVGna.primaryDark-2UJt1G {
        background-color: var(--black2) !important;
      }

      .emptyPreview-1SMLD4 {
        background: var(--black0) !important;
      }

      /* Reactors List */
      .scroller-2GkvCq {
        background: var(--black1) !important;
      }

      .reactionDefault-1Sjj1f:hover,
      .reactionSelected-1aMb2K {
        background-color: var(--black2) !important;
      }

      .reactors-1VXca7 {
        background-color: var(--black2) !important;
      }
    '';
  };
}