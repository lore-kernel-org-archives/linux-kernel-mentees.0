Return-Path: <SRS0=Q7nG=FY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593E9C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Dec 2020 18:54:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB8BC23118
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Dec 2020 18:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB8BC23118
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DB9F8748D;
	Sun, 20 Dec 2020 18:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6We8jC4P5N8; Sun, 20 Dec 2020 18:54:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D84E6871FA;
	Sun, 20 Dec 2020 18:54:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE23EC1825;
	Sun, 20 Dec 2020 18:54:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19C52C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F24E28747C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APGHQoQUQOKw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:54:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5A790871FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:54:43 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id i7so4996576pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 10:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vuqU/q1diqKEzzQ/Yt8Et+WPw/jxmfNrRBkaPvwPYoE=;
 b=ENWPWz1LPe+kSMB1GUyxEDWKjcJOLaXPZXXfhSppIoZAQl0AH6Xbmz4u+r2mWAW02K
 y6U/Z2I8du1qDd9z5XfCDSe1HuIZpf2MR3iSZuz7OBtRvNSIEuV4dIRdErDkuaxWyNP0
 N/EdMYOKqqpZUXdiOjAId57mdV6CRHTEG+SPHZYtBhRIlZJE5Dh9y7j99xGW30ZkeJ+X
 ZwsKPfD2Jdz/RuCHnKCwCTxVGflxbBxn7PVY5XaSEpYhI8aP/tWH73F31TaeQ+XwewpQ
 Q7IMgMJuGfkPfvUoeZRUyuz+nT/hdU02I08sr7us0VaVoiX4TYcDGieDRIbpGp5pjhAN
 iibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vuqU/q1diqKEzzQ/Yt8Et+WPw/jxmfNrRBkaPvwPYoE=;
 b=bZ0OzARVWa2joYQNgrUX/l+q4kKwgEm8DsT4btyM0PxC6YOZrLSlB1/NRRp/vprq5x
 3EEjRZ8wgo85dP2c8YnBDjC9TqKUmzz65ZVvIbmwF8fZr0aCOSiAHNBDqUmNjH5pNDoT
 c2tDQpp4ge7KAP64XCYaPONUVu2Y2gnqg3g9OEg7a/YLqg+4wO6BeUVzRAOr3LpUV65s
 f+ZO5qbOndkOr04a4ztE8rynuSgD6E44IfeIUD2kDVapXmBmC5SQc5XRWVJguEJ5hrjY
 EnOradSFgr2SbFoSif3uNNN7JLdWPSlars02uyABwv5YAxz6JD/kTFUgywEnQ/+U+xPg
 u4Iw==
X-Gm-Message-State: AOAM533CTUcIhWvlcm4hwGOSsfeblvxweoPzlyO0/FeYNo6dL6TCmHJM
 UdDLW6MCFV5hycw16I2W4TB6LWpCBozEi/Mm
X-Google-Smtp-Source: ABdhPJxbg98PuSV2diI9NEWkL1CRFj+P3f7apB2B4JdnvFiYmyTUCu/0iVH7q0FBXPKTexve6qs3DQ==
X-Received: by 2002:a62:7fc1:0:b029:19f:1dab:5029 with SMTP id
 a184-20020a627fc10000b029019f1dab5029mr12121954pfd.13.1608490482544; 
 Sun, 20 Dec 2020 10:54:42 -0800 (PST)
Received: from ?IPv6:2402:3a80:420:966f:e4a8:3fba:bee:da49?
 ([2402:3a80:420:966f:e4a8:3fba:bee:da49])
 by smtp.gmail.com with ESMTPSA id b4sm12981745pju.33.2020.12.20.10.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 10:54:42 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
 <20201220183307.8744-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <fd9cfb58-9ca5-81e6-f7d1-d65398088d07@gmail.com>
Date: Mon, 21 Dec 2020 00:24:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201220183307.8744-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: ignore files not
 following NETWORKING_BLOCK_COMMENT_STYLE
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

On 21/12/20 12:03 am, Aditya Srivastava wrote:
> Currently checkpatch.pl gives warning for NETWORKING_BLOCK_COMMENT_STYLE
> for files in net/ and drivers/net which do not follow the networking
> comment style.
> But some of these files seem to follow the generic comment style instead
> of networking style and some rather mixed style of comment.
> 
> For e.g., drivers/net/wireless/ralink/rt2x00 largely follows generic
> kernel comment style in spite of being inside drivers/net.
> 
> Provide an ignore file(".networking_block_comment_styles.ignore"), where
> users can add the files they want to ignore this warning.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  .gitignore                              |  1 +
>  .networking_block_comment_styles.ignore |  1 +
>  scripts/checkpatch.pl                   | 25 ++++++++++++++++++++++++-
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 .networking_block_comment_styles.ignore
> 
> diff --git a/.gitignore b/.gitignore
> index d01cda8e1177..3cd6074d1fb0 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -94,6 +94,7 @@ modules.order
>  !.gitattributes
>  !.gitignore
>  !.mailmap
> +!.networking_block_comment_styles.ignore
>  
>  #
>  # Generated include files
> diff --git a/.networking_block_comment_styles.ignore b/.networking_block_comment_styles.ignore
> new file mode 100644
> index 000000000000..2022dd619901
> --- /dev/null
> +++ b/.networking_block_comment_styles.ignore
> @@ -0,0 +1 @@
> +drivers/net/wireless/ralink/rt2x00
> \ No newline at end of file
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 00085308ed9d..875e572df5dc 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -832,6 +832,28 @@ sub read_words {
>  	return 0;
>  }
>  
> +my @files_ignoring_networking_comment;
> +my $ignore_file = which_conf(".networking_block_comment_styles.ignore");
> +if(-f $ignore_file) {
> +	open(my $ignore, '<', "$ignore_file")
> +	    or warn "$P: Can't find a readable .networking_block_comment_styles.ignore file $!\n";
> +	while(<$ignore>) {
> +		my $line = "$_";
> +		$line = trim($line);
> +		next if ($line =~ /^\s*$/);
> +		push(@files_ignoring_networking_comment, $line);
> +	}
> +	close($ignore);
> +}
> +
> +sub ignore_networking_comment_style {
> +	my ($realfile) = "@_";
> +	foreach my $file (@files_ignoring_networking_comment) {
> +		return 1 if ($realfile =~ m@^$file@);
> +	}
> +	return 0;
> +}
> +
>  my $const_structs;
>  if (show_type("CONST_STRUCT")) {
>  	read_words(\$const_structs, $conststructsfile)
> @@ -3701,7 +3723,8 @@ sub process {
>  		if ($realfile =~ m@^(drivers/net/|net/)@ &&
>  		    $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
>  		    $rawline =~ /^\+[ \t]*\*/ &&
> -		    $realline > 3) { # Do not warn about the initial copyright comment block after SPDX-License-Identifier
> +		    $realline > 3 &&  # Do not warn about the initial copyright comment block after SPDX-License-Identifier
> +		    !ignore_networking_comment_style($realfile)) {
>  			WARN("NETWORKING_BLOCK_COMMENT_STYLE",
>  			     "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev);
>  		}
> 

Hi Lukas
I have made this patch as I last proposed for how certain files can
avoid this warning by adding in a common .ignore file.

For the start, I have added only one directory name ie,
"drivers/net/wireless/ralink/rt2x00".

In this time, I also found out that users can also use --ignore
NETWORKING_BLOCK_COMMENT_STYLE with checkpatch and it will also result
in ignoring this style.
I don't know though which way is more preferred for the MAINTAINERS.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
