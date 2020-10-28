Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9F9C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:28:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215E6247C5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih7zFdrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 215E6247C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85ED48739B;
	Wed, 28 Oct 2020 15:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqcI+cYDLMnP; Wed, 28 Oct 2020 15:28:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F36C7873CE;
	Wed, 28 Oct 2020 15:28:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD0F0C0859;
	Wed, 28 Oct 2020 15:28:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D65BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 368458739C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8F3CE0ZnJzA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:28:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A30968739B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:28:42 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m128so5331532oig.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKGrPNB8VY3LQZLIHsx4Aa6JAY8bDIVHlFzveCR6UX4=;
 b=Ih7zFdrAotc4WtsW6qAWR4jFp6jczfrdEl2vR32FeX0KmmYWFv6LQLcvdwsIoiE3MG
 a+qKJx44xrY2TFTDG0Hxpq51cRwUtWpKewUy0XznvhuN0qPwbOGF1EpLgMwgL7aaNSMR
 ZDaFSCTAXrujLyEGt8tOrW7ESjqIhXZM3t/yka1O+FaGS/VnIv+jfolFujtz0aDnodxW
 zQw+kf8gS9XKOCnICCDMcWT1em891zkJOSvgowxoGKixvhYIrPM0xV/jN0ix8fy4iSxg
 y5+h15JnQgH64K4k+Yd97L2y+ShpRUISVdVaD8lP41A8Dwm3BU/vhgpO+KPTjuxVRoGB
 5ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKGrPNB8VY3LQZLIHsx4Aa6JAY8bDIVHlFzveCR6UX4=;
 b=cN3aw8q/ObRNO4dixbUgFetNE2VNzp9bjaROSa67+DOTPOIDfQyx8AcBwn8+STmJV5
 Dxt5MkXRJtJVvDE+GcTGdxnyAJmtndPO0yqHlwv2g8m03tnC/xk6S7sTGx0nNhkb6M5K
 z0qLL3Nkxg3Tu8+vG7P9GbSiYvVUe3DMrB8X/L0sDa6beMXKK+DPuZcSmyzWop3M6/Gt
 mBhA+ixSaYPL6fc6pN3JIr9YW07wpWavRNbHbHBS7UuDWmiaRLDF4JmWOyCbs/lOY4l5
 xt+PlhgVl5VqoRj4+jzlqK2CK35NFVaTVUpz6lVs4zG8VwXfc/1aJVSuDrKwLu4ZPcxC
 YQfA==
X-Gm-Message-State: AOAM532Cxex9hNpUsBAYFSRMt2ckVlJzTcho3KObzjwM1VXyLCP7POKg
 E3JkwYaClE7Buh81R5p+xCf+UrZvLqr7b6DZOsE=
X-Google-Smtp-Source: ABdhPJwQKK1aNCun/hN3yMmvRlZf1UpISEb4J5KIaQKaFTLsnTISo2LEBCdFHkognik4R8CIQ2mtfrCz7bGq85sOwO4=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr5623152oig.74.1603898921757; 
 Wed, 28 Oct 2020 08:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201028152501.106117-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 28 Oct 2020 20:58:12 +0530
Message-ID: <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

On Wed, Oct 28, 2020 at 8:55 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> checkpatch has limited support for parsing email comments. It only
> support single name comments or single after address comments.
> Whereas, RFC 5322 specifies that comments can be inserted in
> between any tokens of the email fields.
>
> On analyzing 50,000 commits from v5.4 it was found that there were
> about 370 false positives resulting from wrong parsing of comments.
>
> Improve comment parsing mechanism in checkpatch.
>
> What is handled now:
>
> - Multiple name/address comments
> - Comments anywhere in between name/address
> - Multi level comments like (John (Doe) )
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..ae8436385fc1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1183,14 +1183,20 @@ sub parse_email {
>                 }
>         }
>
> -       $comment = trim($comment);
> +       # Comments in between name like John(A nice chap) Doe
> +       while ($name =~ s/\s*($balanced_parens)\s*/ /) {
> +               $name_comment .= trim($1);
> +       }
>         $name = trim($name);
>         $name =~ s/^\"|\"$//g;
> -       if ($name =~ s/(\s*\([^\)]+\))\s*//) {
> -               $name_comment = trim($1);
> +
> +       # Comments in between address like <john(his account)@doe.com>
> +       while ($address =~ s/\s*($balanced_parens)\s*//) {
> +               $comment .= trim($1);
>         }
>         $address = trim($address);
>         $address =~ s/^\<|\>$//g;
> +       $comment = trim($comment);
>
>         if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
>                 $name =~ s/(?<!\\)"/\\"/g; ##escape quotes
> @@ -1205,8 +1211,6 @@ sub format_email {
>
>         my $formatted_email;
>
> -       $name_comment = trim($name_comment);
> -       $comment = trim($comment);
>         $name = trim($name);
>         $name =~ s/^\"|\"$//g;
>         $address = trim($address);
> @@ -1216,6 +1220,11 @@ sub format_email {
>                 $name = "\"$name\"";
>         }
>
> +       $name_comment = trim($name_comment);
> +       $name_comment =~ s/(.+)/ $1/;
> +       $comment = trim($comment);
> +       $comment =~ s/(.+)/ $1/;
> +
>         if ("$name" eq "") {
>                 $formatted_email = "$address";
>         } else {
> --
> 2.27.0
>

Hi,
This patch is a follow up to our discussion earlier about improving the
comment handling at:
https://lore.kernel.org/linux-kernel-mentees/alpine.DEB.2.21.2010251022060.25172@felia/

I have only tested it on a few patterns.  But I will run an
evaluation again on those 50k commits to see what changes.

What do you think of this?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
