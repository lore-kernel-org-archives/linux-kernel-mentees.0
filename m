Return-Path: <SRS0=8/bg=KJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D77C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 15:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E872613DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 15:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E872613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEEC6082F;
	Fri, 14 May 2021 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hT-VbEn_pJLN; Fri, 14 May 2021 15:11:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87A9605BB;
	Fri, 14 May 2021 15:11:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B46EDC000D;
	Fri, 14 May 2021 15:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6981CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 15:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5088E40460
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 15:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jU8F4tyd3tg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 15:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AD9840133
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 15:11:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v13so16293478ple.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pcLdn48Dmzh4pJ/DDFKwuhkdMQ9PHDMczJ4nmzEd9Tk=;
 b=AVBSh8Ck75TCIvOWZOpauYQenv0shNXgO2EHTbaKy4ujxbyAS/x/8KUgurdmOuErYT
 m1PHjTFDX12xEvLZOGAO+ZObqp/3jE25BxMD8Cl4n55njrq95po6/W4Q5OpUIwIps/tu
 NL/zToKTr1NxMKQd0V/GD1G0fDjLVDtJoKqb82d1J2r9Gw4FC32H7tWyAU3A6M8vFnZw
 GqysU8IbtwZNnkKhon9ANT2iCJUoF1/+L24KuakPDgW7wcjW/o8Db9HndU8V7KBUD8SD
 Ynge5UvdKWxNUVEjVnWUttEivCVz46YKMbnx30BjxfMP+obVCLp9P/t9tFYVuqJ8rOqM
 2A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pcLdn48Dmzh4pJ/DDFKwuhkdMQ9PHDMczJ4nmzEd9Tk=;
 b=bDL78jNo3uj+bxtr0GPcijTYlp3QZe1cWXhIVd+7sqJiFjDSrr5qByOqt5Qh7l10z/
 AbKtk8rwxhYv0S3sIrLBHqFLslNRA7gGMnNNykpdvedA+0Ol8ryShP2qQzNim1/0W6Rd
 4yB85C/QDCF5VQAMjxT0JgDhqEP0NHy48C6o7bedjlc2ZMZGGPjE7yVVe8Ce96l8r3MM
 MCdnNAIiSwSJMGkiQs/og930ip1D7pj7baj+zF6uFVmg9FuGMY5f1oL1kNf6ujXfmDU7
 S7I0nvkb9EjXdWgWpZophpKNaDvI3whZXRZFlJ3D1ePePCHYU+QZYRdOc7ek63FKO6u3
 IlqQ==
X-Gm-Message-State: AOAM532NvfNvIvTGXIS+d1GyaTKXouggWCNBOm7N6Hg/wJqpMResWRO+
 aPsaXhqV1FJLKZnG8I9GniQ=
X-Google-Smtp-Source: ABdhPJwu1U78KOz9u9HwqYVkrAdDD2+Mg/YkZc7akNwJtTCqBgEDo71FIVkTBbBjEb3eXz/jNb8aoQ==
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr11584495pjb.137.1621005065402; 
 Fri, 14 May 2021 08:11:05 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a93f:3d36:ea03:6cce:19ef?
 ([2405:201:600d:a93f:3d36:ea03:6cce:19ef])
 by smtp.gmail.com with ESMTPSA id v15sm4642168pgc.57.2021.05.14.08.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 08:11:04 -0700 (PDT)
Subject: Re: [RFC v4] scripts: kernel-doc: reduce repeated regex expressions
 into variables
To: corbet@lwn.net
References: <87bl9ujy2r.fsf@meer.lwn.net>
 <20210514144244.25341-1-yashsri421@gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <366a8632-7a50-0d60-f93e-09acf5e164ef@gmail.com>
Date: Fri, 14 May 2021 20:40:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210514144244.25341-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-doc@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 14/5/21 8:12 pm, Aditya Srivastava wrote:
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
> Changes in v4:
> - Fix htmldocs warning at function parsing, involving repeated $type2 identifiers capture
> - Re-tested against all files in kernel tree
> 
> Changes in v3:
> - Remove variables for separate qualifiers in "sub dump_struct"
> - Make a common variable for all the qualifiers
> - Make $attribute global variable to use it at "sub check_sections" as well
> 
> Changes in v2:
> - Rename $pointer_function to $function_pointer
> - Combine elsif-block expressions at "sub dump_function" into lesser regex expressions
> - Combine $prototype_end1,$prototype_end2 expressions into a common $prototype_end
> 
>  scripts/kernel-doc | 71 ++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 37 deletions(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 4840e748fca8..7c4a6a507ac4 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -406,6 +406,8 @@ my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
>  my $doc_inline_end = '^\s*\*/\s*$';
>  my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
>  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> +my $function_pointer = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
> +my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
>  
>  my %parameterdescs;
>  my %parameterdesc_start_lines;
> @@ -694,7 +696,7 @@ sub output_function_man(%) {
>  	    $post = ");";
>  	}
>  	$type = $args{'parametertypes'}{$parameter};
> -	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
> +	if ($type =~ m/$function_pointer/) {
>  	    # pointer-to-function
>  	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
>  	} else {
> @@ -974,7 +976,7 @@ sub output_function_rst(%) {
>  	$count++;
>  	$type = $args{'parametertypes'}{$parameter};
>  
> -	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
> +	if ($type =~ m/$function_pointer/) {
>  	    # pointer-to-function
>  	    print $1 . $parameter . ") (" . $2 . ")";
>  	} else {
> @@ -1211,7 +1213,9 @@ sub dump_struct($$) {
>      my $members;
>      my $type = qr{struct|union};
>      # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
> -    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
> +    my $qualifiers = qr{$attribute|__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned};
> +    my $definition_body = qr{\{(.*)\}\s*$qualifiers*};
> +    my $struct_members = qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
>  
>      if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
>  	$decl_type = $1;
> @@ -1235,27 +1239,27 @@ sub dump_struct($$) {
>  	# strip comments:
>  	$members =~ s/\/\*.*?\*\///gos;
>  	# strip attributes
> -	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
> +	$members =~ s/\s*$attribute/ /gi;
>  	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
>  	$members =~ s/\s*__packed\s*/ /gos;
>  	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
>  	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
>  	$members =~ s/\s*____cacheline_aligned/ /gos;
>  
> +	my $args = qr{([^,)]+)};
>  	# replace DECLARE_BITMAP
>  	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
> -	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
> +	$members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
>  	# replace DECLARE_HASHTABLE
> -	$members =~ s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
> +	$members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
>  	# replace DECLARE_KFIFO
> -	$members =~ s/DECLARE_KFIFO\s*\(([^,)]+),\s*([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
> +	$members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2 \*$1/gos;
>  	# replace DECLARE_KFIFO_PTR
> -	$members =~ s/DECLARE_KFIFO_PTR\s*\(([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
> -
> +	$members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
>  	my $declaration = $members;
>  
>  	# Split nested struct/union elements as newer ones
> -	while ($members =~ m/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/) {
> +	while ($members =~ m/$struct_members/) {
>  		my $newmember;
>  		my $maintype = $1;
>  		my $ids = $4;
> @@ -1315,7 +1319,7 @@ sub dump_struct($$) {
>  				}
>  			}
>  		}
> -		$members =~ s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;
> +		$members =~ s/$struct_members/$newmember/;
>  	}
>  
>  	# Ignore other nested elements, like enums
> @@ -1555,8 +1559,9 @@ sub create_parameterlist($$$$) {
>      my $param;
>  
>      # temporarily replace commas inside function pointer definition
> -    while ($args =~ /(\([^\),]+),/) {
> -	$args =~ s/(\([^\),]+),/$1#/g;
> +    my $arg_expr = qr{\([^\),]+};
> +    while ($args =~ /$arg_expr,/) {
> +	$args =~ s/($arg_expr),/$1#/g;
>      }
>  
>      foreach my $arg (split($splitter, $args)) {
> @@ -1707,7 +1712,7 @@ sub check_sections($$$$$) {
>  		foreach $px (0 .. $#prms) {
>  			$prm_clean = $prms[$px];
>  			$prm_clean =~ s/\[.*\]//;
> -			$prm_clean =~ s/__attribute__\s*\(\([a-z,_\*\s\(\)]*\)\)//i;
> +			$prm_clean =~ s/$attribute//i;
>  			# ignore array size in a parameter string;
>  			# however, the original param string may contain
>  			# spaces, e.g.:  addr[6 + 2]
> @@ -1809,8 +1814,14 @@ sub dump_function($$) {
>      # - parport_register_device (function pointer parameters)
>      # - atomic_set (macro)
>      # - pci_match_device, __copy_to_user (long return type)
> -
> -    if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
> +    my $name = qr{[a-zA-Z0-9_~:]+};
> +    my $prototype_end1 = qr{[^\(]*};
> +    my $prototype_end2 = qr{[^\{]*};
> +    my $prototype_end = qr{\(($prototype_end1|$prototype_end2)\)};
> +    my $type1 = qr{[\w\s]+};
> +    my $type2 = qr{$type1\*+};
> +
> +    if ($define && $prototype =~ m/^()($name)\s+/) {
>          # This is an object-like macro, it has no return type and no parameter
>          # list.
>          # Function-like macros are not allowed to have spaces between
> @@ -1818,23 +1829,9 @@ sub dump_function($$) {
>          $return_type = $1;
>          $declaration_name = $2;
>          $noret = 1;
> -    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
> +    } elsif ($prototype =~ m/^()($name)\s*$prototype_end/ ||
> +	$prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
> +	$prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
>  	$return_type = $1;
>  	$declaration_name = $2;
>  	my $args = $3;
> @@ -2111,12 +2108,12 @@ sub process_name($$) {
>      } elsif (/$doc_decl/o) {
>  	$identifier = $1;
>  	my $is_kernel_comment = 0;
> -	my $decl_start = qr{\s*\*};
> +	my $decl_start = qr{$doc_com};
>  	# test for pointer declaration type, foo * bar() - desc
>  	my $fn_type = qr{\w+\s*\*\s*}; 
>  	my $parenthesis = qr{\(\w*\)};
>  	my $decl_end = qr{[-:].*};
> -	if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
> +	if (/^$decl_start([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
>  	    $identifier = $1;
>  	}
>  	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
> @@ -2126,8 +2123,8 @@ sub process_name($$) {
>  	}
>  	# Look for foo() or static void foo() - description; or misspelt
>  	# identifier
> -	elsif (/^$decl_start\s*$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
> -	    /^$decl_start\s*$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
> +	elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
> +	    /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>  	    $identifier = $1;
>  	    $decl_type = 'function';
>  	    $identifier =~ s/^define\s+//;
> 

Hi Jonathan!
The warning you mentioned was not showing to me on running "make
htmldocs", for some reason.. As a result, I haven't been able to test
the patch for this warning.. However, I understood the reason for the
error.
It was in this line:
> +	$prototype =~ m/^($type2)+\s*($name)\s*$prototype_end/)  {

Here, $1 was taking only the last captured value, instead of all the
occurrences, as was desired by me.

Just for reference, these were the warnings which I was getting:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/htmldocs_msgs

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
