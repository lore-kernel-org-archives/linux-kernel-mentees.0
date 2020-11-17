Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F46C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:53:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB00F2463F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqEPfiR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB00F2463F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D3608709B;
	Tue, 17 Nov 2020 10:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A055D0WTYVzO; Tue, 17 Nov 2020 10:53:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BE8387098;
	Tue, 17 Nov 2020 10:53:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B019C0891;
	Tue, 17 Nov 2020 10:53:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2AF3C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 944622046F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBlM-D-8Q+UU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:53:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id E8D3C20111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:53:31 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id w8so8087811ilg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyW7XAR8LZ9w8lnh3LS5r7g+DiE84wawaMfnzAcnoXM=;
 b=fqEPfiR4Bhc7IsRQnsa2c1JvDWXmjoqMk6G+Nj0uWULUI514mO+33Uwi1tIMbSkrVk
 MCm7JOzF0l/i/1QRjzqOqEnCcA6MaKK5LK1xH0CFUBiMTZ0LB1WlJOFfywUZyIr+BVeB
 d79A07lS9s2FF30waUOr2cvAOmQkNWC3iP0a7YqmppqHYBp1osGsRGO8Imk4UVZ5aIjX
 nMxNT22ToEQd4UFnoOzaAfsyanD5bLVHJxF7JXHH5rpGvmgcee6xLFPZcB9NfWAvcyJH
 HxtRwUtIMzMwnmIK5/xsMx3+Zj0/OCgvH1R2sGD86GReeSsMj/NrL75akxvRrYm6B/we
 lQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyW7XAR8LZ9w8lnh3LS5r7g+DiE84wawaMfnzAcnoXM=;
 b=slAcsEAhpb5143z9Chzh6XpfsvmHpTtbx4I6SDhuV5eX65UhJU1J5iqwTp+QsWEiem
 GXMA+N9oVSWDrusyDrNlW1Fb7/0ZiCH0kjFxF9S6tm9K5tFAhfOaa2TaQu9uglRThwBz
 1CmiyNxv1avsk/aQgXIoPhQD8h53Au4N8Dj65PFnhy98cR+fgTG5zqwTlxerq5Fv6Vk+
 0iScBdASGEtqJFAwmy5cNQScWtnuzgbl8aqmDMMtDgeb9FzVrNvPEpxB9H2oax+z+bxK
 ZvET+gOWTWI5RyVuO7g0KV5IlSOv0zvRZdXa8qyekhQ4ZAdakdZk+uCwg7TNOzzJ7Byp
 71+g==
X-Gm-Message-State: AOAM530aQ2qBsC4aoZ5hDLs0vK3TCZdfm2OVivt5HmJ6MEJCJveRE4o6
 MPydhnwEbzWNchPCniIaaZ+318Y0o1p0EXeWB4o=
X-Google-Smtp-Source: ABdhPJwJR34f6Iw+vsR+twaUULkbbLi3rLYMd6bfRDfflrjfB/Mdne2QIarF1UFvADOk1wjv4zgIp3QKNW3M7YkpqrI=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr9619056ill.64.1605610411147; 
 Tue, 17 Nov 2020 02:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20201117104259.32753-1-yashsri421@gmail.com>
In-Reply-To: <20201117104259.32753-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 11:53:20 +0100
Message-ID: <CAKXUXMx+pdxdQj-xDXAPGqM=bKjzuDA1brOiV=m9Ti_HbyfgHg@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

On Tue, Nov 17, 2020 at 11:43 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns if logical continuations are placed at the
> start of a line and not at the end of previous line.
>
> E.g., running checkpatch on commit 3485507fc272 ("staging:
> bcm2835-camera: Reduce length of enum names") reports:
>
> CHECK: Logical continuations should be on the previous line
> +       if (!ret
> +           && camera_port ==
>
> Provide a simple fix by adding logical operator at the end of previous
> line and removing from current line, if both the lines are additions
> (ie start with '+')
>

That change makes sense. I wonder, though. if we are now just starting
to reimplement clang-format (just worse...).

E.g., what happens when you run clang-format on that file; would it do
the same correction to those lines?

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 5b1a5a65e69a..f61ac7456151 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3553,8 +3553,14 @@ sub process {
>
>  # check for && or || at the start of a line
>                 if ($rawline =~ /^\+\s*(&&|\|\|)/) {
> -                       CHK("LOGICAL_CONTINUATIONS",
> -                           "Logical continuations should be on the previous line\n" . $hereprev);
> +                       my $operator = $1;
> +                       if (CHK("LOGICAL_CONTINUATIONS",
> +                               "Logical continuations should be on the previous line\n" . $hereprev) &&
> +                           $fix && $prevrawline =~ /^\+/) {
> +                               # add logical operator to the previous line, remove from current line
> +                               $fixed[$fixlinenr - 1] .= " $operator";
> +                               $fixed[$fixlinenr] =~ s/$operator\s*//;
> +                       }
>                 }
>
>  # check indentation starts on a tab stop
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
