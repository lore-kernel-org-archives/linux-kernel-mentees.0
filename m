Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B8EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:42:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09FF021D6C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lng31QjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09FF021D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9FC5D20417;
	Sat, 12 Sep 2020 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ob7NZnCvzv2k; Sat, 12 Sep 2020 12:42:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3DA6C203F5;
	Sat, 12 Sep 2020 12:42:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24256C0859;
	Sat, 12 Sep 2020 12:42:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8C5AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE1BE86E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4QYHPIw7r6k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:42:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB17E86E8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:42:33 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id lo4so16990136ejb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OdTdco6Gio2Sf8yLBk+xgpt6whcK+HBCntaiF2uSvXg=;
 b=Lng31QjD+wvvlEaBTDMmiS6XOOkYAvjkFWYdf4cXUDO8OpS1fBlnusQ3Fsm4Q5/U+Y
 5M4+ekd7XnURudtgk7s6TpsfJpzYn/IeBd4PfMuNL9BHCTJ7GNT6r+Er4t65r+lGyJ16
 5crdWbNjjIdWu9g3f+qPNlk3Od/mUPA1j94ALss15iKJsr9XEg41+aluJQxhAZmloLXD
 OO5rRSkCfj5H2TRVQMtBHAXDbVVAYC+RnnXkWTk9fYY+ibKGlwp2JIj69ZLbefZ65yF4
 affQRa2I/7I391dTnroj1pzIS5awPxvgwHlmZBVEEfsN80+50Ob1ZwkPOlYVGh6ZrcRY
 ZdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OdTdco6Gio2Sf8yLBk+xgpt6whcK+HBCntaiF2uSvXg=;
 b=n/Z/BuYjS2FMWNrD5zrNXQv/HOr9OeNoTyqx6WLw7Ym0LHc4yC6m1mcLLBCQeqHHzN
 U1WoTv/okHgAcPaNt6JTg7bx045FWtyMWrUIEvjAmmWm4a1YHD0fqsWwUp9L54hHU7K4
 OOABC7fPfgyyi+uff7FoMAzyzfu/FyBVtm9nzBG9fzQbtbCsYGroPda44bUfDzpqNsmM
 kF4yEsPiJxHJs3RaXUvWfD8oy5EvzJx289Y/DyByRZfsOINlbW/8ThQL0kzQo1qnePG4
 vj4IPdl8auHEi5QaSGD78u8GxKm+aOO87HHX8WNCivLhSx8edzutB4LSZ+x1/KKHXB10
 BIjg==
X-Gm-Message-State: AOAM533HTcxFI/lRc2szr9sqFXE13rkuGLbbFBHkjinngAR94lQIQ4NN
 0M+xFGWqYTTTpQ8hH8NkEMo=
X-Google-Smtp-Source: ABdhPJzrG2w8CJX7uDo5vbHLsEOgArxGFBi72ZFiDLXhuPORhdsKjgGktlpGm62qiten87VExy2AFA==
X-Received: by 2002:a17:906:fa81:: with SMTP id
 lt1mr5789172ejb.459.1599914552280; 
 Sat, 12 Sep 2020 05:42:32 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id gc19sm3107314ejb.106.2020.09.12.05.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 05:42:31 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 14:42:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <20200912094826.150170-1-ayush@disroot.org>
Message-ID: <alpine.DEB.2.21.2009121436470.3770@felia>
References: <20200912094826.150170-1-ayush@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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



On Sat, 12 Sep 2020, Ayush wrote:

> checkpatch.pl checks for proper references to other commits with
> the intended format, commit <12+ characters of SHA-1 ID> ("<commit
> message") and warns about typical mistakes. Currently, it does
> not handle the case where there is a line break between commit and the
> hash value.
> It falsely warns that the hash is not prefixed by the word commit.
> 
> This adds new conditions to parse and identify such commits and
> to not report an error in such cases.
> 
> following type of commit reference is handled:
> 
> - commit
> f4d51dffc6c01 ("Linux 5.9-rc4")
> 
> This issue was discovered through a thorough analysis of checkpatch.pl
> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and v5.8.
> 
> Before applying this patch, checkpatch.pl reported 342 errors of type
> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> 
> Signed-off-by: Ayush <ayush@disroot.org>

The patch does not apply on commit f4d51dffc6c0 ("Linux 5.9-rc4").

Applying: checkpatch: handle line break between commit and hash value
Checking patch scripts/checkpatch.pl...
error: while searching for:
my $git_command ='export LANGUAGE=en_US.UTF-8; git';
my $tabsize = 8;
my ${CONFIG_} = "CONFIG_";

sub help {
	my ($exitcode) = @_;


error: patch failed: scripts/checkpatch.pl:68
Hunk #2 succeeded at 2825 (offset -6 lines).
Hunk #3 succeeded at 2841 (offset -6 lines).
Hunk #4 succeeded at 2872 (offset -6 lines).
Applying patch scripts/checkpatch.pl with 1 reject...
Rejected hunk #1.
Hunk #2 applied cleanly.
Hunk #3 applied cleanly.
Hunk #4 applied cleanly.
Patch failed at 0001 checkpatch: handle line break between commit and hash value


What commit is your patch based on?

Try always to test that the commit applies on the current master and on 
the latest linux-next.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
