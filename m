Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187B5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:16:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B082078A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6aEDl4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B082078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 782AF86AFD;
	Thu, 27 Aug 2020 06:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJ50d7dr4zWG; Thu, 27 Aug 2020 06:16:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED05A86A4F;
	Thu, 27 Aug 2020 06:16:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4058C016F;
	Thu, 27 Aug 2020 06:16:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54295C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4A1A487A60
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXYvN4S0rM8f
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:16:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1BA3588158
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:16:45 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m23so4653882iol.8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 23:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4bpUY/yr5Mb+SigUHOEz3j9fnCLv4ZKr92JvnrRqXE=;
 b=Z6aEDl4yOz2Q1O93P4KQNxa/0oMIMOI9DtZRkXNzxh3hsjmIxvOU5f1O7mtQPWzv+8
 YBAKN6ANR9G7JW2VGg/pqLcbCB5z+Hh9w8sKIJJhev3oqvGDBXS7LmoXXrCgKl4KA2xb
 iy11w/3wMVHMLGqgRR7wpguONDPjIhzI8aytMTBlEYcr+M9DauuF1ekROzE2EQyrCh4K
 Rp2Trk3LXK1E3ZUzT/Jze32doRPa6o4j9S73ZCp73PSlNDe8rBK0QpDvsCtgB3jBTBGx
 /rrXoGEjQS3GBZDjoIJbn5eTirV998Wet5WHbBPKCPhJcrw6QQHz0D7H2EFh6p/LhxPz
 yuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4bpUY/yr5Mb+SigUHOEz3j9fnCLv4ZKr92JvnrRqXE=;
 b=ohRRa+eZyTJ4NZb0FgedZc7n5KsgoIloTQVxIaulinIuOJxmn1EXwo+1gHspj3NrkV
 /2keQum5Yo3fD74tKcmawLuMZ8AStaoZoCJb/V9qa3YMRZ6/Ygs9oLQuMCltVsk/wpeO
 wwlhi8Iz4/PRjKgG6ijep3Abgaf81lWgtyXXkJc6fE8f56izawm/T3/ExEpp5NVF3GUu
 mThtSJKCaWP4gCoBfi/s4U3nIBpWmWYU1EWmFcrGZA58/LZVeT6R5OPB/oGiqy7J/j8W
 X2pYkNsGKRZwLp0mgNchIs465TEy53B3dZzDhLVYcfWRhMaoHT2FSETVH1/cCHcD7k2t
 hpxQ==
X-Gm-Message-State: AOAM530tX3h4wvaYcK47miOhoQOI59VApJrgd7hLFeFDWODgAI6Gb5j7
 hOZwnl4ABG+9oQznwLe+uPqff0HMiAPrO1r/tuE=
X-Google-Smtp-Source: ABdhPJwEEjBiM2gT9Zfzb2EdjqHArczWDxmHnisR5jZKgxKay3D6DJJ6U5S0KqsDBePFbJuCXviu6H9xrdSkpCcXhBA=
X-Received: by 2002:a05:6638:24d1:: with SMTP id
 y17mr18643983jat.42.1598509004374; 
 Wed, 26 Aug 2020 23:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
 <20200827061307.54526dz54p3gd45u@mrinalpandey>
In-Reply-To: <20200827061307.54526dz54p3gd45u@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 27 Aug 2020 08:16:33 +0200
Message-ID: <CAKXUXMyZsENwp2jM106N_uao+yj=R-tGJDLerSO-GqtL+Qd3qg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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

On Thu, Aug 27, 2020 at 8:13 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>
> On 20/08/27 11:35AM, Mrinal Pandey wrote:
> > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > spdxcheck-test.sh to repository without the executable flag and license

s/to/to the/

> > information.
> >
> > commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> > dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> > Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> > and commit 9b4ade226f74 ("xen: build infrastructure for generating
> > hypercall depending symbols") added the file xen-hypercalls.sh without the
> > executable bit.
> >
> > Set to usual modes for these files and provide the SPDX license for
> > spdxcheck-test.sh. No functional changes.
> >
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/gcc-plugins/gen-random-seed.sh | 0
> >  scripts/nsdeps                         | 0
> >  scripts/spdxcheck-test.sh              | 2 +-
> >  scripts/xen-hypercalls.sh              | 0
> >  4 files changed, 1 insertion(+), 1 deletion(-)
> >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> >  mode change 100644 => 100755 scripts/nsdeps
> >  mode change 100644 => 100755 scripts/spdxcheck-test.sh
> >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> >
> > diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plugins/gen-random-seed.sh
> > old mode 100644
> > new mode 100755
> > diff --git a/scripts/nsdeps b/scripts/nsdeps
> > old mode 100644
> > new mode 100755
> > diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
> > old mode 100644
> > new mode 100755
> > index cfea6a0d1cc0..758fa645ed99
> > --- a/scripts/spdxcheck-test.sh
> > +++ b/scripts/spdxcheck-test.sh
> > @@ -1,5 +1,5 @@
> >  #!/bin/sh
> > -

Why do you delete the newline?

> > +# SPDX-License-Identifier: GPL-2.0
> >  for PYTHON in python2 python3; do
> >       # run check on a text and a binary file
> >       for FILE in Makefile Documentation/logo.gif; do
> > diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
> > old mode 100644
> > new mode 100755
> > --
> > 2.25.1
> >
>

I think it is fine to have this as a single patch. It is local enough
to say that we are touching all those files in a single go.

Other than that, it looks good to me.

Please state to whom you intend to send this patch.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
