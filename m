Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229C1C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 18:39:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EEEA21707
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 18:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HV7/qkVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EEEA21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7BE752725F;
	Wed,  7 Oct 2020 18:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHAOLayakkGC; Wed,  7 Oct 2020 18:39:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 94CE2204B7;
	Wed,  7 Oct 2020 18:39:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83A01C016F;
	Wed,  7 Oct 2020 18:39:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D54EFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C3ECF85E7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvfHdasi7pcn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 99D4585E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:39:01 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 60so3197267otw.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Oct 2020 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igZM3jEU+aFzJ/Spz32umO0y+Ys5Oai0gHignz/H8ps=;
 b=HV7/qkVSFo835HTJxMaJ1Yw2xZr2paOJi3thR59WWzvp7EZ+VEpWbJ25x184Nvj/Bz
 LAG1FD9gJh5zZm2KZLp1s1LxGDKOh/OHNjMS7PF7sUPgBjiaptYgDho9HwaKNKU9vAlm
 gXPHeaF5/RaXzTpEl0pCRtlGi2UYzNWfaNZinKaXPFL8w2nz5rHCPy/fF1R9x3cgMY1L
 zlBytLZsQqAJOKz2bhOQF1T2H9UUiBSgR3VRbHR4fMrAjGhtNDUGX2i4yGl8XdchdVg1
 gn6OK9kh+5cwUtM1PYVOOK7n9b/Qd9LwuSvA+FwbxALrX59+iPmUeQ86KaBYaF6UMWLn
 BjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igZM3jEU+aFzJ/Spz32umO0y+Ys5Oai0gHignz/H8ps=;
 b=alsknrEPoeL9YnUeC28bjEFk4jo4RbtDhP4fC2DFy2oq4oh5dQkpDAeF1laCIqTZs0
 Os2f6bJ6eaz/PWglVz1Z0ToBLoNS8eX8O9+EwC601MvEePSdhQGaamkZKXsZS4K/Xbmb
 xPKg+YPV0VxczBjWQWyRhuoQof047vHIXCTJCPAGiKEjueZjJoyhBQEtDJTGoIdGbaWt
 lM4X3jC1tnqWkQvcWEttd/uaOPHijcpzyyAjob+6TtrlR76pi9GpXQe891k7KIH7HdiG
 VQFcvz9NX3MwzEW369m9ZtU9lQQu7Qn7+aDFJePbM2XpyeevfR1j15utMLzbRd8c+YQ1
 U/3Q==
X-Gm-Message-State: AOAM532Dt81VsD8xc7ISjZZNvvhXqvg49Dsza72v5YRNyHANOd2NU8yO
 bC6FbCpnWFb6+5897KeHj3U4vfsJb8M3417nIUQ=
X-Google-Smtp-Source: ABdhPJxaCAs/Naeu9Vj+uI/q3ssAAv8bT0Us3tz2UWmFKO/fzJurNlSBU76/AscJtztybSz+guyhqNIlsylbtHrDZJc=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr1072527otq.265.1602095940663; 
 Wed, 07 Oct 2020 11:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201007063315.41585-1-dwaipayanray1@gmail.com>
 <CABJPP5AEELQz0t2+34xYQOJ5e5nQzTUUU6UT8ZH0fqm-tacOmg@mail.gmail.com>
 <a2db6d34e964bd5ca65f59d1a536a61df71fc955.camel@perches.com>
In-Reply-To: <a2db6d34e964bd5ca65f59d1a536a61df71fc955.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 8 Oct 2020 00:08:37 +0530
Message-ID: <CABJPP5B_nscUwm4m+PySN67Cp=i1aR8KXKRuAf2YdAj_950j2Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new warnings
	to author signoff checks.
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

On Wed, Oct 7, 2020 at 11:48 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-07 at 12:08 +0530, Dwaipayan Ray wrote:
> > On Wed, Oct 7, 2020 at 12:03 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > > The author signed-off-by checks are currently very vague.
> > > Cases like same name or same address are not handled separately.
>
> Likely now, the type should be changed from NO_AUTHOR_SIGN_OFF
> to a single something else for all the other types of messages.
>
>
Since BAD_SIGNOFF is being used for a different context, then
probably BAD_AUTHOR_SIGNOFF.

Should this work or anything else you have in mind?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
