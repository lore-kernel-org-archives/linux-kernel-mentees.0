Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9EC5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:26:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9468B2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3JrJoeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9468B2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A02A8695B;
	Wed, 11 Nov 2020 19:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgdgS3lnEBqY; Wed, 11 Nov 2020 19:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C567986959;
	Wed, 11 Nov 2020 19:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE2BDC088B;
	Wed, 11 Nov 2020 19:26:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A74B7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E64087527
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnYEPRnbFOy8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F022087525
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:26:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id o11so3421078ioo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGJ5UhfKRWsL2A6/LU9uFuN/xOAeSIto5B1wK9+mhuY=;
 b=r3JrJoeR3dJPCWYhd138eWFX/3lqBDxvc7eA4dsKCTjAc318NIZpKVwjVTdqZrcfh5
 rgV8e1RHTji5Pz6iu21jpHADElk1nA1oeMBeicP45Ufa7bn5SYuJJ5n3Lg+DjrXGx1ne
 4OskABK7p0vwbpxGO/LWynim11Q3Um+hQeDfJhPdOcM22H0wcM6FKzZ7Luv0DzoKHG1N
 lbEWyUhg8swyfZt7o4TXeI/8ymqZuP7+nhiwceS5Yya/Ei8rbEnOoswjA/Oe26p8aonb
 Dhbqw34MTyPlHjOjzg2KRcmrZTKkM3VO0KZPzo8ULCszp7QFMnyjPdY1WwBAxIK/l+Fm
 KAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGJ5UhfKRWsL2A6/LU9uFuN/xOAeSIto5B1wK9+mhuY=;
 b=OXXcSRhXGWgX2Br3Vts8H0jK0kOnuZNSMU7cUFdCgwx3Yl7X3olEhpd4+I1kCrgPI1
 c6f4190NZaQxcV5YOpROWmaNNu27iTDKTXCVDwtGlLKkgdohgcwVu7rVMmMl0SJ/9Y+m
 vfrkamcMPDVpnTdilV5uvPjig5T3XeGvcsHXcoYjug8H78olFeamYAnWzXDTmgEq2ClU
 UqMERytCozy9CepfZgqo5xy0XyawHmwsHR6rKph2zTe3hYKpQNhgcpfqyi9xiTUdAVNP
 c3J7pUwgdrV4bEZA2EOXvjyJxAqaWgEXC4EX8S2cm2vekron99ywmtDqBzr9bQZRKlWA
 bu2A==
X-Gm-Message-State: AOAM531ligeqDQfTUwMQ8kqvBpAS0x1M4FgeDwfl/Fvfm5y9BP19HZ90
 ie/eVw68rqh5x2X4DFH1LP7ksoyUl5pVygFQ7pA=
X-Google-Smtp-Source: ABdhPJx6m4A2/ngnpMjVm+OOI7JrZ6ym6ZmYDY7VBEJtKD5ndZG17np4tTbtr3kBz2U3v+MKtUTPQ2abkzp/QCllsmk=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr11312172iom.102.1605122798170; 
 Wed, 11 Nov 2020 11:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20201111191954.398-1-yashsri421@gmail.com>
In-Reply-To: <20201111191954.398-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 11 Nov 2020 20:26:29 +0100
Message-ID: <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns us for long lines in commits even for
> signature tag lines.
>
> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
> clear Mac Table Digest") reports this warning:
>
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
> This is an example of false positive. Provide a fix by excluding
> signature tag lines from this class of warning.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ac7e5ac80b58..1d257b1f4a4f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2963,6 +2963,8 @@ sub process {
>                                         # filename then :
>                       $line =~ /^\s*(?:Fixes:|Link:)/i ||
>                                         # A Fixes: or Link: line
> +                     $line =~ /^\s*(?:$signature_tags)/ ||
> +                                       # signature tag line

Can you simply add this check to the expression above?

>                       $commit_log_possible_stack_dump)) {
>                         WARN("COMMIT_LOG_LONG_LINE",
>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
