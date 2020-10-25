Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACA6C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 05:51:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED38D20878
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 05:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC3f2v9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED38D20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0343627366;
	Sun, 25 Oct 2020 05:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pj4eZlCqmLTu; Sun, 25 Oct 2020 05:51:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C30F927236;
	Sun, 25 Oct 2020 05:51:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A723FC0893;
	Sun, 25 Oct 2020 05:51:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D8EBC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 05:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E54B086B23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 05:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yz0l0cfL8p3u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 05:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC7A886B22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 05:51:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n15so8474831wrq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 22:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EyC1wUuJoNDGVTQiSISpNVOiUpZLJk9AxlNcup9iaro=;
 b=eC3f2v9+iVx4V90rHSU094lMV9oUz8YymCBBWRM3mLplBLmXIp2OmdQTfCGT5vNMjr
 BxHntbhaaRpv5sRq0GXmnFs/fRTbdyuOKlEHiBl8NUdGKSFg9Q76eUUFwB661+xtQuJ6
 tXSHrJJrI3um7fKHC7r5GZgGx+YYTRmo1OkrGZZoLCL9ELW2HJn6Plag3jx+Upabdrz/
 7Uf4/tlCVnTy5WNuxARhy51sVu4YozGAMsGR9wc04DrUxeUQTbZf8lfxGKFvbHpuTc84
 iLThgNBKsPpmFayS3pNtW+ugWn0NXJL6eGdoqRQ3YdAMVCaKNcR7VthU8V9WQ89JGTWJ
 2KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EyC1wUuJoNDGVTQiSISpNVOiUpZLJk9AxlNcup9iaro=;
 b=P3Zh20Nk521WUzIi1nKc+H2gsNwTB6591esE02M3osd/Kt3i9PlwbhKi79I1yT4szk
 deGpxkKbMVTYe6pAcTHN7j9vC3oj2Hbqs9bKZs63hexACNqHxpH8MlxjnRS3dTK11ZZ5
 9a15DTKsDFeLfk25PHS9sA48aVS3g06wT1sFg/cOkngzPhgesphFjebUPwo2WYuYRl3f
 pw8oWuJtKVtB8WFuo7mXQVWzQkXoFPdI9b2UdzDP87/DnGL6w5sFXL74HVRmib0A0MMb
 qEkhNFvUL0yRGj+6jJEyaHukt029SsqtEgZaj1X33LTdFs0WO+/8B7EVS/7h3qNYmrGf
 QXjQ==
X-Gm-Message-State: AOAM531VcaUeSTsxhpJAuCtf1A75eIdaW/tJjshWkhksfdlFPaHvLa+i
 oDAgEYwg5BvJuuAKEC0e5Ks=
X-Google-Smtp-Source: ABdhPJzrHchsx+qXnogtQWwtYHc7ZUvhGj0qp0FywB/bwATQWhB2XnOY74QhFrFV/eswfSHDBKCJ1Q==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr10918334wrp.367.1603605088206; 
 Sat, 24 Oct 2020 22:51:28 -0700 (PDT)
Received: from felia ([2001:16b8:2d75:ef00:cd2e:52e:ef1c:926])
 by smtp.gmail.com with ESMTPSA id v123sm13559348wme.7.2020.10.24.22.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 22:51:27 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 25 Oct 2020 06:51:19 +0100 (CET)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010250627370.6697@felia>
References: <20201023133828.19609-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2010232104150.11676@felia>
 <c9512657-d7d0-bf04-0e40-b3463c9f5e1b@gmail.com>
 <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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



On Sat, 24 Oct 2020, Joe Perches wrote:

> On Sat, 2020-10-24 at 18:54 +0530, Aditya wrote:
> > > Would you like to work on 
> > > further rules that can be improved with your evaluation approach?
> > 
> > Yes, I would like work on further rules.
> 
> Some generic ideas:
> 
> How about working to reduce runtime and complexity by
> making the rules extensible or separable at startup.
> 
> Maybe move each existing rules into a separate
> directory as an individual file and aggregate them at
> checkpatch startup.
> 
> Maybe look at the existing rules that do not have a
> $fix option and add them as appropriate.
>

I certainly support working on fixes.

I have this crazy dream that:

We can identify a set of rules and clear automatic fixes that
maintainers can simply run this script over the patches they pick
up when they pick them up.
Realistically in an easy interactive mode that works with the maintainers' 
workflow, so they simply confirm the automatic fixes where the script 
cannot be 100% sure that the quick fix is the right thing to do.

I think for commit message fixes that would be very nice.
E.g., correcting URLs, normalizing tags, correcting obvious typos.
 
> You could fix the multiline indentation where the
> current warning and fix is only for a single line
> 
> 	value = function(arg1,
> 		arg2,
> 		arg3);
> 
> where checkpatch emits only single warning and fix
> for the line with arg2, but not the line with arg3);
> 
> Maybe try to make the coding styles supported more
> flexible:
> 
> Allow braces in different places, support different
> tab indentation sizes, spacing rules around operators,
> function definition layouts, etc.
> 
>

This is a nice idea as well. And I recommend to do this kind of research 
looking at checkpatch and clang-format; both will not be the 'final tools' 
but I think if you can identify a good mix and combination of those two 
tools, we will get a good step forward of documenting the 
commonalities and differences of coding styles in the different 
subcommunities (the preferences of specific maintainers and subsystems).

A last nice idea to consider:

I would like to have an interactive checkpatch.pl mode where an authors
can say that they ran checkpatch.pl, seen the warning and errors 
reported, but disagree and comment why they disagree. Then this kind of
information is added to the patch in a non-disturbing area of the patch
and we can pick up and aggregate that information from the patches to see
the complaints, false positives to address or suggestions which rules
should be disabled for some subcommunities.

Aditya, your task is now to make those ideas more specific and write down 
a one to two page project proposal for the mentorship. It can be to some 
extent in bullet points as long as it is roughly understandable to all of 
us what you plan and would like to do.

With that proposal accepted, you have shown to be applicable to the 
mentorship program here and we take care of the last organisational points 
before the start.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
