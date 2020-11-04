Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D67C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 11:14:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC284221F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 11:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCaekPK7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC284221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A519873D6;
	Wed,  4 Nov 2020 11:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AhBLr3Erb9q; Wed,  4 Nov 2020 11:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C01C8732E;
	Wed,  4 Nov 2020 11:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DC26C0889;
	Wed,  4 Nov 2020 11:14:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A27F6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 11:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 91A7F868DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 11:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mI0zLj09dBvV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 11:14:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6EA47868D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 11:14:36 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m9so8134986iox.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Nov 2020 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yS1S2EbDV3178JfYPdXQw8Y+fAAV0lrbSLN5aIfUviU=;
 b=KCaekPK7XP/mTf4Pb/J3c/qvbGsJzE1/rK4FGU0oIi7Jh+BjxOvs+P95hpSrc5L+8X
 XCPl+35le9sExUVf8Vs6mtsZmfZ5txFt8O1XAw3B3BJMs1YZGoDsaUpwm2OvZHbT6Rxl
 b2POtoksvofaWct3dL3MMdAdgkEPBXU1wcN5scxS8C6RT9MCQBW2luBWSmUqvPqftbmR
 Z1ELbyEbvQ1dYut3g1pxDeDZQ22uMd1BNx4D9vCdppeSw5LKx1m4LANxIgfZQFHxu6OZ
 FqEz35+cQTeIVncmewosm1bT9l2rlmmMgqaKw8MCXjB1T7ICgXwyLGRjrLoJYA3Vjp/A
 Ewbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yS1S2EbDV3178JfYPdXQw8Y+fAAV0lrbSLN5aIfUviU=;
 b=p7aDsizBNAVTuzLU13c+MZ/eiE9PN7CaMvQqeHduhQ0nvpKOpuU6pYUodsxNGNZhpd
 dDxeNHbOF2Jr2yQYZT613NQv7J5I69RPRkHvzLc8I6rwHku7t2/CKlqfVYebOACY/M3p
 Wwuthl2AUO7jip4oFpj7HXPJMuFsxZ87xHPygLgkDckgvXJhiVHxODzFUeSdRQDIEpux
 fKNPJTdPWxL4WbfyVZ1x64+gk8hXrSeYwsswlw9mXfbM0gh04k/DPlFkMdg18s0J8gaN
 gvkzZVHUxb7L8LMsNZbm1nbTGlj+HiT359sCYFrrAZEZTltZgR6cZCx/OzwBo3vKAbgG
 bcBw==
X-Gm-Message-State: AOAM53043AklniDNEqVpxvvnCuSGkIy5j7BuNzLqDzwSDu2a4QTnW1UV
 jG9MA6BvVLbDBPNCtCRLnD1t+jiPfbrKkCi/29M=
X-Google-Smtp-Source: ABdhPJyDyG7Sk4s6OxcSNt7IU8/wMnf90f9tXS8F7onoIvPIpSnjcHD8SOleSEZStzaEzB+xnxuIXjK3ijj4yRMUfGY=
X-Received: by 2002:a02:c952:: with SMTP id u18mr19101826jao.139.1604488475613; 
 Wed, 04 Nov 2020 03:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20201103151858.25375-1-yashsri421@gmail.com>
In-Reply-To: <20201103151858.25375-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 4 Nov 2020 12:14:20 +0100
Message-ID: <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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

On Tue, Nov 3, 2020 at 4:19 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns us if the author of the commit signs-off
> as co-developed-by.
> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> CPU vulnerabilities for Spectre") we get:
>
> WARNING: Co-developed-by: should not be used to attribute nominal
> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
>
> Provide a simple fix by removing the co-developed-by line from the
> commit message
>

Patch looks good. Maybe you can add a statistics on how many cases of
the last 200,000 commits this rule would actually trigger?

E.g., you can probably quickly filter all commits that have at least
one Co-developed-by tag among those last 200,000 commits (that is
already only a few thousands), then take that list and just check with
checkpatch.pl for this one rule quickly to see how often the rule
would even trigger at all.

Once you have that and explain that in the commit message, I think the
patch is ready for lkml and Joe Perches.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 58095d9d8f34..1030d4fc2abf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2827,8 +2827,11 @@ sub process {
>  # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
>                         if ($sign_off =~ /^co-developed-by:$/i) {
>                                 if ($email eq $author) {
> -                                       WARN("BAD_SIGN_OFF",
> -                                             "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                                "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline) &&
> +                                           $fix) {
> +                                               fix_delete_line($fixlinenr, $rawline);
> +                                       }
>                                 }
>                                 if (!defined $lines[$linenr]) {
>                                         WARN("BAD_SIGN_OFF",
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
