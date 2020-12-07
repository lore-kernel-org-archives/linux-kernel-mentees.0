Return-Path: <SRS0=2gri=FL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E22DC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 12:54:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F812233FB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 12:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F812233FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65B9E871C9;
	Mon,  7 Dec 2020 12:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SC9jzSq2gcIv; Mon,  7 Dec 2020 12:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E467786C50;
	Mon,  7 Dec 2020 12:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9BB5C0FA7;
	Mon,  7 Dec 2020 12:54:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31745C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 187EF86C50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7TS6j0Yeeum
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5822C86E29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:54:38 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q137so13209207iod.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Dec 2020 04:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3ScbY43RLHxXTQGX/4N/ja4WM/l0ssTYYv83QrgVDQ=;
 b=B+zy8IioTdg+l9wATOx57fXU11PeGf3pomz3hDDrMOoihBh5LjbT5NgymkdRcKt3rT
 hDFR9BIkUm9cNGxmADANc2L8oLbY47z4TK4xFAK47lpIAwpdJGyqXXjxJM/cBUjHFR4C
 +1FfKe7QA2sX4CFfQ/hIFGxPYn8Ffy1j9L7M6uD/yEFV/PXF0QqFkiJzw8vVlBn8sRJ1
 XC3mnC6M0Sh8CIaDXdclRP3ubgvh4HXUl2otfSGUqlqEFMIUUcIaw75I497oraPzawQM
 AP1k+y0liIsrJ5JGLuzmZQurHcyD3ED5MY5taVkZ5hLwUZh5rKshXiWsDZD/Q/wlSERL
 RRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3ScbY43RLHxXTQGX/4N/ja4WM/l0ssTYYv83QrgVDQ=;
 b=tjCCf3mVdCDo2tCyj/YFziCEJy7RJykEh+wAkROVFuI6MRVrTCRjYrrqz6WkaqZbKN
 olrQ57Q94iKuWc2f9heT6lnbSN9pT6HRcKy4PaT2XARbh8TPy5sBCIpivNUlhzMd1sp1
 b5qqkaMd7vXGfvYugC9dyxpPCuzs+Rm0ioQ1sdjk16k22waDrEQKMYgYZ0vY1JWR/aPU
 ttcFCq5RHqrkicp1Pfdooyttu/1z10AiivWt17YvqBcyk6Mc46RBTAHZZLC/Z1VzEPaQ
 C3hgRXItIJfF/2/vsXbLIJmlOr6CKh00X0h+SBFpBA4VMctqUyruIOFpiKy6wDxKrZkP
 TXzg==
X-Gm-Message-State: AOAM530u3HnpTWBDCyRN9wyFREP1py/QkrmFeWighnYI3ljhpg2LLzG9
 hQd4RdPjR8FZSaSY7nY0RRzxlULPXFU1DMHtWvk=
X-Google-Smtp-Source: ABdhPJwax9ZFcSh3t+dbhTSTUIv4LAom5ASLau0hjp4UlmKnv8ReaEoDEyG2Fh8CHUVTAph55k+JPxHxNan9uwtqGCk=
X-Received: by 2002:a5e:9906:: with SMTP id t6mr20223952ioj.183.1607345677648; 
 Mon, 07 Dec 2020 04:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20201207124302.17128-1-yashsri421@gmail.com>
In-Reply-To: <20201207124302.17128-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 7 Dec 2020 13:54:32 +0100
Message-ID: <CAKXUXMxyP9ZhqGihktJcL1rpdbHZW7xCrK3-WmLV=k4gFMo3tQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	CONSIDER_KSTRTO
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

On Mon, Dec 7, 2020 at 1:43 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Checkpatch recommends the usage of kstrto* over simple_strto* and
> strict_strto*, as these are obsolete.
>
> E.g., running checkpatch on commit f79b3f338564 ("ftrace: Allow
> enabling of filters via index of available_filter_functions") reports
> this warning:
>
> WARNING: simple_strtoul is obsolete, use kstrtoul instead
> +       long index = simple_strtoul(func_g->search, NULL, 0);
>
> Provide a fix by replacing simple_strto* and strict_strto* with kstrto*
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b086d1cd6c2..ca5bb5a3f8f6 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6980,8 +6980,12 @@ sub process {
>
>  # recommend kstrto* over simple_strto* and strict_strto*
>                 if ($line =~ /\b((simple|strict)_(strto(l|ll|ul|ull)))\s*\(/) {
> -                       WARN("CONSIDER_KSTRTO",
> -                            "$1 is obsolete, use k$3 instead\n" . $herecurr);
> +                       if (WARN("CONSIDER_KSTRTO",
> +                                "$1 is obsolete, use k$3 instead\n" . $herecurr) &&
> +                           $fix) {
> +                               my $kstrto = "k$3";
> +                               $fixed[$fixlinenr] =~ s/$1/$kstrto/;
> +                       }
>                 }
>

Does this only warn on added lines?

The fix looks good; I just do not know if the rule is applicable in
full generality.

You might want to check a few instances if that rule actually makes
sense and is accepted.

Lukas

>  # check for __initcall(), use device_initcall() explicitly or more appropriate function please
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
