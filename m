Return-Path: <SRS0=Zzie=JT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F3DC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 19:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DD861417
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 19:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DD861417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B51F40F22;
	Thu, 22 Apr 2021 19:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYJ6WJbXci9H; Thu, 22 Apr 2021 19:33:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF95040F2D;
	Thu, 22 Apr 2021 19:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB8AEC000E;
	Thu, 22 Apr 2021 19:33:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD9B7C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CDF4403E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igHO9Ta40QFg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:33:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3789E403DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:33:28 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id a11so3543989ioo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRRMGl/vCfQiHNla468vJj3a67wpQAIqT49f0aOpDg8=;
 b=sPHoEb9mE8tAnDLWNl25kC9oWPMTQgkhD7IlG7x/TlBP7BtS/2AdIhU25kA+5izwWo
 NO0mZjCgqGu3oclBJgbge+CDfntIPOIBJYjMp55QAC1JAR821pDh/qA/6eh3i+X8Eylf
 bFm+3rgvuIa3qC1+gCQCHnWBMq+sehrb7qjRw6VYfDAFe0w1aJ/3ZLZ7Gn86MY0hXR01
 V2vB4ZoIHk1ZDRCJCe6xDy+NzLpCQz5EFwi6q5vgbz9tEXLbxesem9qgIjRyV2mDhATh
 uIiEyoKdt6pa5oJ89EhPMEdmB99RETxkW2GzrJ1QrZigfvRSnsmo/EsgykBwPuXQV7vg
 145g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRRMGl/vCfQiHNla468vJj3a67wpQAIqT49f0aOpDg8=;
 b=Tvt4n7+CJqjRrLG6HD4xP3r1R8PCxs31UJx9VBu4YoXSQlZtVJgctH74OOr76SPRF3
 dbouv9smFaHoUTwiH69P84uwTXU82lJDdom+Mia1kJCuIWJ9tQr2kXRMFj8rWGt6B5Vr
 ME62Hhm1WtaDKwjEnjKsOGd7DSAIcIe8BWP6lH5ii4/weU6/tv6YSrA4sZ8AchTtlt5S
 oRGXgxHgniJpjid1X2iRY6k5lvGsz5bMDN7nDINqk/qOi0Rk3crZTPVJEbUGPeA3j2s0
 u/I15kty0XtLMqgWULzr3h/9oWwjIHwjhKd+KZ5ahmbdUniko7swB83zuy64BEBqXJ7Z
 Yijg==
X-Gm-Message-State: AOAM532qzfH7HtfBl+0RLtcaDv113StangNzmJJ8xw5Cx5LkNBIYWR50
 a6+EP2JzoP9AaRXLrRfo1IhU5FXKnbaE9SmfB+0=
X-Google-Smtp-Source: ABdhPJw5zyEm2RzorNz6AMZ7pQBNoNC+mDNZAUZZoFTUf/NE7p1PMaaC1Etcr4OkcD2CrTXSGjec1m8OhuYEVo10SH8=
X-Received: by 2002:a05:6602:2b08:: with SMTP id
 p8mr392272iov.189.1619120007219; 
 Thu, 22 Apr 2021 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210422191839.6119-1-yashsri421@gmail.com>
In-Reply-To: <20210422191839.6119-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 22 Apr 2021 21:33:13 +0200
Message-ID: <CAKXUXMx9q57cWXkcezKKo-uuh21Sd-Si9M9KydzFEMQ0ELYEng@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions into
 variables
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8598646639710422245=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8598646639710422245==
Content-Type: multipart/alternative; boundary="000000000000e10f5705c094c05f"

--000000000000e10f5705c094c05f
Content-Type: text/plain; charset="UTF-8"

Aditya Srivastava <yashsri421@gmail.com> schrieb am Do., 22. Apr. 2021,
21:18:

> There are some regex expressions in the kernel-doc script, which are used
> repeatedly in the script.
>
> Reduce such expressions into variables, which can be used everywhere.
>
> A quick manual check found that no errors and warnings were added/removed
> in this process.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 89 ++++++++++++++++++++++++++--------------------
>  1 file changed, 50 insertions(+), 39 deletions(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 2a85d34fdcd0..579c9fdd275f 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -406,6 +406,7 @@ my $doc_inline_sect =
> '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
>  my $doc_inline_end = '^\s*\*/\s*$';
>  my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
>  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
>
>  my %parameterdescs;
>  my %parameterdesc_start_lines;
> @@ -694,7 +695,7 @@ sub output_function_man(%) {
>             $post = ");";
>         }
>         $type = $args{'parametertypes'}{$parameter};
> -       if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
> +       if ($type =~ m/$pointer_function/) {
>             # pointer-to-function
>             print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" .
> $post . "\"\n";
>         } else {
> @@ -974,7 +975,7 @@ sub output_function_rst(%) {
>         $count++;
>         $type = $args{'parametertypes'}{$parameter};
>
> -       if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
> +       if ($type =~ m/$pointer_function/) {
>             # pointer-to-function
>             print $1 . $parameter . ") (" . $2 . ")";
>         } else {
> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
>      my $decl_type;
>      my $members;
>      my $type = qr{struct|union};
> +    my $packed = qr{__packed};
> +    my $aligned = qr{__aligned};
> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
> +    my $cacheline_aligned = qr{____cacheline_aligned};
> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
>      # For capturing struct/union definition body, i.e.
> "{members*}qualifiers*"
> -    my $definition_body =
> qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
> +    my $definition_body =
> qr{\{(.*)\}(?:\s*(?:$packed|$aligned|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};
> +    my $struct_members =
> qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
>
>      if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
>         $decl_type = $1;
> @@ -1235,27 +1242,27 @@ sub dump_struct($$) {
>         # strip comments:
>         $members =~ s/\/\*.*?\*\///gos;
>         # strip attributes
> -       $members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
> -       $members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
> -       $members =~ s/\s*__packed\s*/ /gos;
> +       $members =~ s/\s*$attribute/ /gi;
> +       $members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;
> +       $members =~ s/\s*$packed\s*/ /gos;
>         $members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
> -       $members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
> -       $members =~ s/\s*____cacheline_aligned/ /gos;
> +       $members =~ s/\s*$cacheline_aligned_in_smp/ /gos;
> +       $members =~ s/\s*$cacheline_aligned/ /gos;
>
> +       my $args = qr{([^,)]+)};
>         # replace DECLARE_BITMAP
>         $members =~
> s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1,
> __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
> -       $members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned
> long $1\[BITS_TO_LONGS($2)\]/gos;
> +       $members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long
> $1\[BITS_TO_LONGS($2)\]/gos;
>         # replace DECLARE_HASHTABLE
> -       $members =~
> s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2)
> - 1)\]/gos;
> +       $members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long
> $1\[1 << (($2) - 1)\]/gos;
>         # replace DECLARE_KFIFO
> -       $members =~
> s/DECLARE_KFIFO\s*\(([^,)]+),\s*([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
> +       $members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2
> \*$1/gos;
>         # replace DECLARE_KFIFO_PTR
> -       $members =~ s/DECLARE_KFIFO_PTR\s*\(([^,)]+),\s*([^,)]+)\)/$2
> \*$1/gos;
> -
> +       $members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
>         my $declaration = $members;
>
>         # Split nested struct/union elements as newer ones
> -       while ($members =~
> m/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/) {
> +       while ($members =~ m/$struct_members/) {
>                 my $newmember;
>                 my $maintype = $1;
>                 my $ids = $4;
> @@ -1315,7 +1322,7 @@ sub dump_struct($$) {
>                                 }
>                         }
>                 }
> -               $members =~
> s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;
> +               $members =~ s/$struct_members/$newmember/;
>         }
>
>         # Ignore other nested elements, like enums
> @@ -1555,8 +1562,9 @@ sub create_parameterlist($$$$) {
>      my $param;
>
>      # temporarily replace commas inside function pointer definition
> -    while ($args =~ /(\([^\),]+),/) {
> -       $args =~ s/(\([^\),]+),/$1#/g;
> +    my $arg_expr = qr{\([^\),]+};
> +    while ($args =~ /$arg_expr,/) {
> +       $args =~ s/($arg_expr),/$1#/g;
>      }
>
>      foreach my $arg (split($splitter, $args)) {
> @@ -1808,8 +1816,11 @@ sub dump_function($$) {
>      # - parport_register_device (function pointer parameters)
>      # - atomic_set (macro)
>      # - pci_match_device, __copy_to_user (long return type)
> +    my $name = qr{[a-zA-Z0-9_~:]+};
> +    my $prototype_end1 = qr{\(([^\(]*)\)};
> +    my $prototype_end2 = qr{\(([^\{]*)\)};
>

Why do you need end1 and end2 here?

-    if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
> +    if ($define && $prototype =~ m/^()($name)\s+/) {
>          # This is an object-like macro, it has no return type and no
> parameter
>          # list.
>          # Function-like macros are not allowed to have spaces between
> @@ -1817,23 +1828,23 @@ sub dump_function($$) {
>          $return_type = $1;
>          $declaration_name = $2;
>          $noret = 1;
> -    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -       $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -       $prototype =~
> m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
> +    } elsif ($prototype =~ m/^()($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^(\w+)\s+($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +       $prototype =~ m/^()($name)\s*$prototype_end2/ ||
> +       $prototype =~ m/^(\w+)\s+($name)\s*$prototype_end2/ ||
> +       $prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +       $prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +       $prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +       $prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +       $prototype =~
> m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +       $prototype =~
> m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*($name)\s*$prototype_end2/)  {
>         $return_type = $1;
>         $declaration_name = $2;
>         my $args = $3;
> @@ -2110,12 +2121,12 @@ sub process_name($$) {
>      } elsif (/$doc_decl/o) {
>         $identifier = $1;
>         my $is_kernel_comment = 0;
> -       my $decl_start = qr{\s*\*};
> +       my $decl_start = qr{$doc_com};
>         # test for pointer declaration type, foo * bar() - desc
>         my $fn_type = qr{\w+\s*\*\s*};
>         my $parenthesis = qr{\(\w*\)};
>         my $decl_end = qr{[-:].*};
> -       if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
> +       if (/^$decl_start([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
>             $identifier = $1;
>         }
>         if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
> @@ -2125,8 +2136,8 @@ sub process_name($$) {
>         }
>         # Look for foo() or static void foo() - description; or misspelt
>         # identifier
> -       elsif
> (/^$decl_start\s*$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
> -           /^$decl_start\s*$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
> +       elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/
> ||
> +           /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>             $identifier = $1;
>             $decl_type = 'function';
>             $identifier =~ s/^define\s+//;
> --
> 2.17.1
>
>

--000000000000e10f5705c094c05f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gma=
il.com">yashsri421@gmail.com</a>&gt; schrieb am Do., 22. Apr. 2021, 21:18:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">There are some regex expressions in=
 the kernel-doc script, which are used<br>
repeatedly in the script.<br>
<br>
Reduce such expressions into variables, which can be used everywhere.<br>
<br>
A quick manual check found that no errors and warnings were added/removed<b=
r>
in this process.<br>
<br>
Suggested-by: Jonathan Corbet &lt;<a href=3D"mailto:corbet@lwn.net" target=
=3D"_blank" rel=3D"noreferrer">corbet@lwn.net</a>&gt;<br>
Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">yashsri421@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/kernel-doc | 89 ++++++++++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 50 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/scripts/kernel-doc b/scripts/kernel-doc<br>
index 2a85d34fdcd0..579c9fdd275f 100755<br>
--- a/scripts/kernel-doc<br>
+++ b/scripts/kernel-doc<br>
@@ -406,6 +406,7 @@ my $doc_inline_sect =3D &#39;\s*\*\s*(@\s*[\w][\w\.]*\s=
*):(.*)&#39;;<br>
=C2=A0my $doc_inline_end =3D &#39;^\s*\*/\s*$&#39;;<br>
=C2=A0my $doc_inline_oneline =3D &#39;^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\=
s*$&#39;;<br>
=C2=A0my $export_symbol =3D &#39;^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)=
\s*;&#39;;<br>
+my $pointer_function =3D qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};<br>
<br>
=C2=A0my %parameterdescs;<br>
=C2=A0my %parameterdesc_start_lines;<br>
@@ -694,7 +695,7 @@ sub output_function_man(%) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $post =3D &quot;);&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $type =3D $args{&#39;parametertypes&#39;}{$para=
meter};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ($type =3D~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)=
\)/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ($type =3D~ m/$pointer_function/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pointer-to-function<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;.BI \&quot;&quot; . $=
parenth . $1 . &quot;\&quot; &quot; . &quot; \&quot;) (&quot; . $2 . &quot;=
)&quot; . $post . &quot;\&quot;\n&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
@@ -974,7 +975,7 @@ sub output_function_rst(%) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $count++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $type =3D $args{&#39;parametertypes&#39;}{$para=
meter};<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ($type =3D~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)=
\)/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ($type =3D~ m/$pointer_function/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pointer-to-function<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print $1 . $parameter . &quot;) (=
&quot; . $2 . &quot;)&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
@@ -1210,8 +1211,14 @@ sub dump_struct($$) {<br>
=C2=A0 =C2=A0 =C2=A0my $decl_type;<br>
=C2=A0 =C2=A0 =C2=A0my $members;<br>
=C2=A0 =C2=A0 =C2=A0my $type =3D qr{struct|union};<br>
+=C2=A0 =C2=A0 my $packed =3D qr{__packed};<br>
+=C2=A0 =C2=A0 my $aligned =3D qr{__aligned};<br>
+=C2=A0 =C2=A0 my $cacheline_aligned_in_smp =3D qr{____cacheline_aligned_in=
_smp};<br>
+=C2=A0 =C2=A0 my $cacheline_aligned =3D qr{____cacheline_aligned};<br>
+=C2=A0 =C2=A0 my $attribute =3D qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*=
\)\)}i;<br>
=C2=A0 =C2=A0 =C2=A0# For capturing struct/union definition body, i.e. &quo=
t;{members*}qualifiers*&quot;<br>
-=C2=A0 =C2=A0 my $definition_body =3D qr{\{(.*)\}(?:\s*(?:__packed|__align=
ed|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([=
a-z0-9,_\s\(\)]*\)\)))*};<br>
+=C2=A0 =C2=A0 my $definition_body =3D qr{\{(.*)\}(?:\s*(?:$packed|$aligned=
|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};<br>
+=C2=A0 =C2=A0 my $struct_members =3D qr{($type)([^\{\};]+)\{([^\{\}]*)\}([=
^\{\}\;]*)\;};<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ($x =3D~ /($type)\s+(\w+)\s*$definition_body/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $decl_type =3D $1;<br>
@@ -1235,27 +1242,27 @@ sub dump_struct($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # strip comments:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $members =3D~ s/\/\*.*?\*\///gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # strip attributes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*__attribute__\s*\(\([a-z0-9,=
_\*\s\(\)]*\)\)/ /gi;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*__aligned\s*\([^;]*\)/ /gos;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*__packed\s*/ /gos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*$attribute/ /gi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*$aligned\s*\([^;]*\)/ /gos;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*$packed\s*/ /gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $members =3D~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*____cacheline_aligned_in_smp=
/ /gos;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*____cacheline_aligned/ /gos;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*$cacheline_aligned_in_smp/ /=
gos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/\s*$cacheline_aligned/ /gos;<br=
>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0my $args =3D qr{([^,)]+)};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # replace DECLARE_BITMAP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $members =3D~ s/__ETHTOOL_DECLARE_LINK_MODE_MAS=
K\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*=
([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_BITMAP\s*\($args,\s*$ar=
gs\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # replace DECLARE_HASHTABLE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_HASHTABLE\s*\(([^,)]+),=
\s*([^,)]+)\)/unsigned long $1\[1 &lt;&lt; (($2) - 1)\]/gos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_HASHTABLE\s*\($args,\s*=
$args\)/unsigned long $1\[1 &lt;&lt; (($2) - 1)\]/gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # replace DECLARE_KFIFO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_KFIFO\s*\(([^,)]+),\s*(=
[^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_KFIFO\s*\($args,\s*$arg=
s,\s*$args\)/$2 \*$1/gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # replace DECLARE_KFIFO_PTR<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_KFIFO_PTR\s*\(([^,)]+),=
\s*([^,)]+)\)/$2 \*$1/gos;<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/DECLARE_KFIFO_PTR\s*\($args,\s*=
$args\)/$2 \*$1/gos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $declaration =3D $members;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Split nested struct/union elements as newer o=
nes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while ($members =3D~ m/(struct|union)([^\{\};]+=
)\{([^\{\}]*)\}([^\{\}\;]*)\;/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while ($members =3D~ m/$struct_members/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $newmember;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $maintype =3D $1=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $ids =3D $4;<br>
@@ -1315,7 +1322,7 @@ sub dump_struct($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/(st=
ruct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$members =3D~ s/$st=
ruct_members/$newmember/;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore other nested elements, like enums<br>
@@ -1555,8 +1562,9 @@ sub create_parameterlist($$$$) {<br>
=C2=A0 =C2=A0 =C2=A0my $param;<br>
<br>
=C2=A0 =C2=A0 =C2=A0# temporarily replace commas inside function pointer de=
finition<br>
-=C2=A0 =C2=A0 while ($args =3D~ /(\([^\),]+),/) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$args =3D~ s/(\([^\),]+),/$1#/g;<br>
+=C2=A0 =C2=A0 my $arg_expr =3D qr{\([^\),]+};<br>
+=C2=A0 =C2=A0 while ($args =3D~ /$arg_expr,/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$args =3D~ s/($arg_expr),/$1#/g;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0foreach my $arg (split($splitter, $args)) {<br>
@@ -1808,8 +1816,11 @@ sub dump_function($$) {<br>
=C2=A0 =C2=A0 =C2=A0# - parport_register_device (function pointer parameter=
s)<br>
=C2=A0 =C2=A0 =C2=A0# - atomic_set (macro)<br>
=C2=A0 =C2=A0 =C2=A0# - pci_match_device, __copy_to_user (long return type)=
<br>
+=C2=A0 =C2=A0 my $name =3D qr{[a-zA-Z0-9_~:]+};<br>
+=C2=A0 =C2=A0 my $prototype_end1 =3D qr{\(([^\(]*)\)};<br>
+=C2=A0 =C2=A0 my $prototype_end2 =3D qr{\(([^\{]*)\)};<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why do you need end1=
 and end2 here?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
-=C2=A0 =C2=A0 if ($define &amp;&amp; $prototype =3D~ m/^()([a-zA-Z0-9_~:]+=
)\s+/) {<br>
+=C2=A0 =C2=A0 if ($define &amp;&amp; $prototype =3D~ m/^()($name)\s+/) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This is an object-like macro, it has no=
 return type and no parameter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# list.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Function-like macros are not allowed to=
 have spaces between<br>
@@ -1817,23 +1828,23 @@ sub dump_function($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$return_type =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$declaration_name =3D $2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$noret =3D 1;<br>
-=C2=A0 =C2=A0 } elsif ($prototype =3D~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)=
\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*=
\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:=
]+)\s*\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:=
]+)\s*\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z=
0-9_~:]+)\s*\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z=
0-9_~:]+)\s*\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([=
a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\=
{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*=
\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:=
]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:=
]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z=
0-9_~:]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z=
0-9_~:]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([=
a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([=
a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+=
)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+=
\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)=C2=A0 {<br>
+=C2=A0 =C2=A0 } elsif ($prototype =3D~ m/^()($name)\s*$prototype_end1/ ||<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+)\s+($name)\s*$prototype=
_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s*\*+)\s*($name)\s*$pro=
totype_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+)\s+($name)\s*$pro=
totype_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+)\s*($name)\=
s*$prototype_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+)\s+($name)\=
s*$prototype_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($=
name)\s*$prototype_end1/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^()($name)\s*$prototype_end2/=
 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+)\s+($name)\s*$prototype=
_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s*\*+)\s*($name)\s*$pro=
totype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+)\s+($name)\s*$pro=
totype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+)\s*($name)\=
s*$prototype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+)\s+($name)\=
s*$prototype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($=
name)\s*$prototype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($=
name)\s*$prototype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+=
)\s*($name)\s*$prototype_end2/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$prototype =3D~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+=
\s*)\s*($name)\s*$prototype_end2/)=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $return_type =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $declaration_name =3D $2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $args =3D $3;<br>
@@ -2110,12 +2121,12 @@ sub process_name($$) {<br>
=C2=A0 =C2=A0 =C2=A0} elsif (/$doc_decl/o) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $is_kernel_comment =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0my $decl_start =3D qr{\s*\*};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0my $decl_start =3D qr{$doc_com};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # test for pointer declaration type, foo * bar(=
) - desc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $fn_type =3D qr{\w+\s*\*\s*}; <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $parenthesis =3D qr{\(\w*\)};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $decl_end =3D qr{[-:].*};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$=
decl_end?$/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (/^$decl_start([\w\s]+?)$parenthesis?\s*$dec=
l_end?$/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($identifier =3D~ m/^(struct|union|enum|type=
def)\b\s*(\S*)/) {<br>
@@ -2125,8 +2136,8 @@ sub process_name($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Look for foo() or static void foo() - descrip=
tion; or misspelt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # identifier<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (/^$decl_start\s*$fn_type?(\w+)\s*$parent=
hesis?\s*$decl_end?$/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/^$decl_start\s*$fn_type?(\w+.*)$=
parenthesis?\s*$decl_end$/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (/^$decl_start$fn_type?(\w+)\s*$parenthes=
is?\s*$decl_end?$/ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/^$decl_start$fn_type?(\w+.*)$par=
enthesis?\s*$decl_end$/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $decl_type =3D &#39;function&#39;=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D~ s/^define\s+//;<=
br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--000000000000e10f5705c094c05f--

--===============8598646639710422245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8598646639710422245==--
