Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA97C6369E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:14:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBADA247FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezc/P5hY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBADA247FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C4C82041A;
	Wed, 18 Nov 2020 17:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzVXs6WSvMkB; Wed, 18 Nov 2020 17:13:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 02536204A3;
	Wed, 18 Nov 2020 17:13:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D37FFC0891;
	Wed, 18 Nov 2020 17:13:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DDB3C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 64100204A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMF+KodpWooG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 7872B2041A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:13:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q28so1642780pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 09:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b8/BlIr9f4WzXS/EBhsu/b11XrwJrZeGYJtiBWjL1CQ=;
 b=ezc/P5hYucrOec9AsWiCSuuYN0wjEE9KM0qABlBNQhSOD6K8+kNMPh/++P/u/kfbNv
 3yBODBSTnu1jka9JxE9Wq+0LY4ePQI7QE610aXI2rnDxXI0nQ4ecnYzWYmyR+eqcOMt6
 Y6lki+K6LNhKNHD9Px1fHchp0YW6fWTDwYWkIBcTZTNzRtM9lTqm2a9dSkMaqDgang3h
 pZZ9wHcQs/nlvfJP0bwWvEpkgKVbZ273tDd0yHaXVHJsL4kd4Qcr6U8rU7lsumIGlj1/
 6tslkMxq1XKgZQSimH49RgisVsexWmmKz26HpnqDo1xqt2U2lfq7YmQGeCSCT+604yp0
 QTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8/BlIr9f4WzXS/EBhsu/b11XrwJrZeGYJtiBWjL1CQ=;
 b=U610oUiUqT4ZtTDTVyVM1JZn73QU/ISzgd5SCVuNwHUUeFxfoPUh/oMCmKVDPXnSu7
 L9CC5blD2c1DcgaXfKtzEo9kZxNquStF7qyU+t4oTGw+k45nPGI9LHerL5FDQfljiPfD
 gcmq/vqokJILetygIoQqtU6guTDoFJP1fJhMWspKw14pC1CQYcuzKzdheL9QyHGKSeMb
 uprBZRjnJHdo3TWtDILtdVqYzo0UP4NbWtaop/a8171dmynUBZ6S5EuC0zf5SGZ4Buix
 ZUiDgJtzvB4p/Iq7bgaZ9mUFiDzifRjqFwX7QnqvPOdjt4IzWvdBHoqboL1GDHuC/W/e
 /8Yg==
X-Gm-Message-State: AOAM532WJJwBQqEaXGEG4WevaGYbVbT6Xw9FtdwjDJTWPrze4u8SyhPi
 znv+c6bhWof145nR8UIO1OwpocKP+XLB+g==
X-Google-Smtp-Source: ABdhPJxzrBJRBhgURSAfO9+MjYZ2+QELL7SCaRLMOv7n91zj8mqCTb/kBrQqYPaLeid4CEk3BbbjVg==
X-Received: by 2002:a62:27c1:0:b029:196:59dc:8e6 with SMTP id
 n184-20020a6227c10000b029019659dc08e6mr5278201pfn.72.1605719635786; 
 Wed, 18 Nov 2020 09:13:55 -0800 (PST)
Received: from ?IPv6:2402:3a80:43c:f24e:b031:6d03:e76d:9978?
 ([2402:3a80:43c:f24e:b031:6d03:e76d:9978])
 by smtp.gmail.com with ESMTPSA id s4sm2871678pjr.44.2020.11.18.09.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 09:13:55 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201118170950.31566-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
Date: Wed, 18 Nov 2020 22:43:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118170950.31566-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
 NETWORKING_BLOCK_COMMENT_STYLE
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

On 18/11/20 10:39 pm, Aditya Srivastava wrote:
> Currently, checkpatch warns us if we use an empty '/*' line for comment
> and contents of the comment are in next line.
> 
> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
> the refs / unrefs from the transport") reports this warning:
> 
> WARNING: networking block comments don't use an empty /* line, use /* Comment...
> +		/*
> +		 * If the TXQ is active, then set the timer, if not,
> 
> Provide a fix by appending the current line contents to previous line
> and deleting the current line
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f61ac7456151..90e863d63097 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3629,8 +3629,14 @@ sub process {
>  		    $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
>  		    $rawline =~ /^\+[ \t]*\*/ &&
>  		    $realline > 3) { # Do not warn about the initial copyright comment block after SPDX-License-Identifier
> -			WARN("NETWORKING_BLOCK_COMMENT_STYLE",
> -			     "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev);
> +			if (WARN("NETWORKING_BLOCK_COMMENT_STYLE",
> +				 "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev) &&\
> +			    $fix) {
> +				if ($rawline =~ /^\+[ \t]*\*\s*(.*)/) {
> +					fix_delete_line($fixlinenr, $rawline);
> +					$fixed[$fixlinenr - 1] .= " $1";
> +				}
> +			}
>  		}
>  
>  # Block comments use * on subsequent lines
> 

I have generated the warnings occurring for this class of warnings
(over 4.13..5.8):
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/warnings.txt

My initial tests at these warnings found the fix to be working fine.


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
