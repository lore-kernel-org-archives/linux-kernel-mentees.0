Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314D8C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 05:48:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB47221EA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 05:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LopPYPEv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB47221EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A7DEF8991D;
	Tue, 14 Jul 2020 05:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDHY6hJVw3pP; Tue, 14 Jul 2020 05:48:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A09089800;
	Tue, 14 Jul 2020 05:48:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1F56C0888;
	Tue, 14 Jul 2020 05:48:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E05B0C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C992C89807
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdqLD3Pwaoyl
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:48:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECC4789800
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:48:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o8so3076875wmh.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 22:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EAzKSdWricR5ttWzxJcej8NnEUGQf3yoT+bgnVWs/aY=;
 b=LopPYPEv0sMvHpbJPRIQq+MnF2YNyNYbxkfS3l3gFCUkzQ6ckXkW6gyRWP2XQHfLP8
 4p8bft2/UBgELkFsi+7VAl//mZGGFuaD74PdHAV3rUpwTWiWj4QhVD6H3KUXLKkxCU5H
 Hb81jh/UiO1Pm83Atys1VviCzytmmDj2ZFdF/L5A3lQ8QRXoiWnE9gB+wBKwB28CODJk
 XpXv7ND4SPkKNMTNafdcniArk1gJFeDNmGPuAGqtbeWzGJBvmbG6gdC+kZqfa6JFZAm9
 /44SyLzdjD/wd/KJ6ZMjUFtK+8ayIXe+kS6WcmmjrCCy9Y5I6mF9ivZaXIOujrsb2lFK
 BMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EAzKSdWricR5ttWzxJcej8NnEUGQf3yoT+bgnVWs/aY=;
 b=g7BTLo6jCw0QFc3jmfvj+zRtThK6K9irayeKd/8B6QktRzpMwwX7zfgMlEoA0hmRvd
 Iw4l+96AOl8AcNOt/LzneXw7c97XbPWTj1EYU61/pN/ZWHN4zXwm2ExaKrObsQ3jWChl
 GB/ddLtFj/g+fcxHFCMgal2LRwNhL1qJQmlXKTvGV+Eg/DnU5sq96WGlpFk3tDB3ATvB
 QHl8+HZkYN2agbCKa7rVNxyjX0HMl8m2UFIawEcaGEgQH/gAUjQYVdjU353YFYdBa0Rm
 7XQfwTaYBz08vEpkp/+vJXSVd8+34iPXlw/VOFbV80iUN3ipmpfEjQGltYxM/XIxNS4q
 ZRdQ==
X-Gm-Message-State: AOAM5306YSvHIYDBtWsXs1JL0Nl+Xs//vEUnHiyRTLuZ6PN5iJZ3ewO/
 TT6bgkBoA1nasSAtcZ+H3x0=
X-Google-Smtp-Source: ABdhPJyc/LwHvI/XIqOZYVldXieGlMH8I8uy8BpZn77lXHp6Qlr59Ka9C1mLlgijviGlXqc5OhzaEg==
X-Received: by 2002:a1c:1dc7:: with SMTP id d190mr2564530wmd.36.1594705686282; 
 Mon, 13 Jul 2020 22:48:06 -0700 (PDT)
Received: from felia ([2001:16b8:2d88:ea00:c4fb:750d:a5d0:9d75])
 by smtp.gmail.com with ESMTPSA id j4sm27982046wrp.51.2020.07.13.22.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 22:48:05 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 14 Jul 2020 07:47:58 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007140742570.6558@felia>
References: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, joe@perches.com, apw@canonical.com,
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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



On Tue, 14 Jul 2020, Mrinal Pandey wrote:

> The usage of "capture group (...)" in the immediate condition after `&&`
> results in `$1` being uninitialized. This issues a warning "Use of
> uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
> line 2638".
> 
> I noticed this bug while running checkpatch on the set of commits from
> v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in
> their commit message.
> 
> This bug was introduced in the script by commit e518e9a59ec3
> ("checkpatch: emit an error when there's a diff in a changelog"). It has
> been in the script since then.
> 
> The author intended to store the match made by capture group in variable
> `$1`. This should have contained the name of the file as `[\w/]+` matched.
> However, this couldn't be accomplished due to usage of capture group and
> `$1` in the same regular expression.
> 
> Fix this by placing the capture group in the condition before `&&`.
> Thus, `$1` can be initialized to the text that capture group matches
> thereby setting it to the desired and required value.
> 
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
> Changes since v1:
> Add Reviewed-by and Tested-by tag
>


Usually, the maintainers pick up those tags when they apply a patch to 
their tree, and the patch authors do not need to add those tags and resend 
the patch as a new version on the mailing list.

Mrinal, can you please go through and check the kernel documentation on 
submitting patches and find the places where it is pointed out that the 
maintainers usually apply those tags and the authors usually do not need 
to resend a new version of the patch with the tags applied?

If you cannot find such a statement in the documentation, please let us 
know where it would ideally added in the documentation. We can then create 
a patch for that together.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
