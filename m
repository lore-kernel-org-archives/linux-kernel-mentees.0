Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732DBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:49:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC53207CD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYzlD63H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC53207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C05E85AB5;
	Thu, 27 Aug 2020 09:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3PEQafcr3IX; Thu, 27 Aug 2020 09:49:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4516785755;
	Thu, 27 Aug 2020 09:49:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 292F3C016F;
	Thu, 27 Aug 2020 09:49:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C5AAC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1B29786404
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5gLBMfFNIaZ
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:49:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1DC3C8616F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:49:35 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id oz20so6821997ejb.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iNFyrfAX8/Dn97tnpLT6eU3mzRCVxFI29SHF2tFkwxs=;
 b=oYzlD63HjA4+DgXzN/1Ec87ehOgzdrOBe9xX47ITGPxUYdy+i0ojrGPm4cGks3PSNN
 HvGhEtGGNd6KePcpw1D2UWrBHxc0z/LuEJrhXT/lETucxjtAkxJ6YgNTpZTEOIMHnrOt
 v8NFwYQmtIAyVMt16KmBGv7XsAFMclfxvGb5Uo3IE5bT7bsiWPCBnQ+R+wY8478XLio3
 +2E2HrNgT/0kBwkNaNxUFJAOBL8oawX3FTVnvEPusCpqGXP+6/oh52SRyzJ5ngbpG0Il
 AtSxn7vV+6RjPbEZo0EmBcTJcFZuizUFOfda9FAVTPK8DlR/BDZsEmL9rm+TKjHEgspz
 ZRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iNFyrfAX8/Dn97tnpLT6eU3mzRCVxFI29SHF2tFkwxs=;
 b=LmhVvJTK1U3YYXwIPOcT3GSY9qLsnIFTJwKX01ipwTScbYZkoBnNEKStg8l3zswfZ9
 vJUJk/0xb8hSSBMwTB1b6P4UiHAcXPhfzeWgEvuEggi/7uwaW8K14n0dzOYrxB8lgrKE
 TyephIdHYJ6eb+zmFJ5Oh05oDcvuWSYZrVH0tvevS2XBkkWsND2bIaiz7XECv2Tquicj
 D6/dBqiethhVfH8g5gU7feDNCava33OOr/mp43Js2pEOd6rBDr0+b6h/igSH+OY8f8MA
 E5upoe5yhGr2Cl8qZc/NdZ9OOMnJySMweNibCgtGM3j2jb3ee7utM3XsDejfc+GKAJeu
 u+KQ==
X-Gm-Message-State: AOAM531p32l6Ts/k+whBttFeTBS3T6e9rz35fwKGOUREL/a8N9itKjja
 iAZH4UaCYvTb2lNnamHc6UA=
X-Google-Smtp-Source: ABdhPJws8TUBrPbN9lQbtTHLNVjZCVt2cECt/XVnEfPGgUck2J+q/BX4fGva8KrSrGEPM6fODacOqw==
X-Received: by 2002:a17:906:3091:: with SMTP id
 17mr3818701ejv.515.1598521773405; 
 Thu, 27 Aug 2020 02:49:33 -0700 (PDT)
Received: from felia ([2001:16b8:2d0c:fc00:340b:71b8:4541:aa75])
 by smtp.gmail.com with ESMTPSA id d18sm1486506ejo.70.2020.08.27.02.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 02:49:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 27 Aug 2020 11:49:31 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <20200827094344.GA400189@kroah.com>
Message-ID: <alpine.DEB.2.21.2008271145370.25858@felia>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
 <20200827094344.GA400189@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-spdx@vger.kernel.org, maennich@google.com, linux-kernel@vger.kernel.org,
 re.emese@gmail.com, tglx@linutronix.de,
 Linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org
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



On Thu, 27 Aug 2020, Greg KH wrote:

> On Thu, Aug 27, 2020 at 02:54:05PM +0530, Mrinal Pandey wrote:
> > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > spdxcheck-test.sh to the repository without the executable flag and license
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
> > applies cleanly on next-20200827
> > 
> > Kees, Matthias, Thomas, please ack this patch.
> > 
> > Andrew, please pick this minor non-urgent cleanup patch once the
> > mainainers ack.
> > 
> >  scripts/gcc-plugins/gen-random-seed.sh | 0
> >  scripts/nsdeps                         | 0
> >  scripts/spdxcheck-test.sh              | 1 +
> >  scripts/xen-hypercalls.sh              | 0
> >  4 files changed, 1 insertion(+)
> >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> >  mode change 100644 => 100755 scripts/nsdeps
> >  mode change 100644 => 100755 scripts/spdxcheck-test.sh
> >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> 
> This does 2 different things in one patch, shouldn't this be 2 different
> patches?  One to change the permissions and one to add the SPDX line?
>

For me, this was one thing: minor cleanup; and taking one 
minor patch is easier than taking two, but you make the call. Then, the 
two or even three patches would also just travel through different trees, 
the spdx tree and Andrew's.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
