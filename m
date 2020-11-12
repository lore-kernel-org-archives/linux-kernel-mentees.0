Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FD4C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:09:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4112C20825
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ngl8LQsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4112C20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B012485CA8;
	Thu, 12 Nov 2020 16:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3D-DI5Z4pMe; Thu, 12 Nov 2020 16:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC4ED8458C;
	Thu, 12 Nov 2020 16:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2080C0889;
	Thu, 12 Nov 2020 16:09:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65A5EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B5042E207
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBPXt0R2MI06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 9253D2E1FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:09:32 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u18so9195581lfd.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 08:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdRVVw/oVViDWQGfer1btxkF7WpjyIamPSzhPPtGczI=;
 b=Ngl8LQsgkx+ZK/P0O5m46lxYhamom+IS5pWDWUPuQv2qfexM6EQJO7OVfmaen72FGe
 BePuqEqxJp8VZ9hM/0G2FMRTk7mz6qtAVlLUsTBeYlg4eGfE37ar7B5Dg6vCO/QKcxjr
 Dj4cCc6fJ8ggW4I1Iz+SPJg9oFYW+y0A6v5qKCyard9PcNLXITNK4h/MtrnThsKb8Fqr
 rrsSA2i2cUCODpdYadxHNMn6lWmTMZF0HqTRWcn9lNzz+HxHKVDOSFejLURmYi0GtfLK
 M1g0cOv40ZArGCIa71PNuvTW9ZheMgfms88c+6ka7hkQFP+nAxNCb+kbG3Pe2TxicEpN
 ek/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdRVVw/oVViDWQGfer1btxkF7WpjyIamPSzhPPtGczI=;
 b=NQ0vTS1tM8G4EX9TKuEFpnyzwDmAVaAzdV3PMlt4GdRsCP0OsVkyM9zSnHuFR+Qb3W
 kcj+M4Ff6yw1+vsiqWBIH6MPL77NHV/fje0sHYz4hWQlrt0A0jvG8DA3IAmZE0AT0reg
 UfjgdeYXQUvmBHezsjx7eh7yJlBSy1Auw97Dhhz56V1CADrNF7lhIV+NhdXdkYpTDiop
 C8PnovNhkiAmxFlgR8QLPuS0OzdDNR+N4yLynS3nSK89n/TJVkvyCCOeE6b7Rx+Izzh/
 7D1AvkVF7vapfrTLJDthzye32MFoIKNNLStddYmOIBPxZ9ZQqETTieV1Mys4U604SWlT
 ZXFQ==
X-Gm-Message-State: AOAM531jAFKmiw9mt7bXFRwHxf25nBYcLz2PgwbxzmZ9HlwEraypd6Lz
 sOgf9YSdTOs1Sl1V9kYOLjUi1nt5ulJEVXQysl4=
X-Google-Smtp-Source: ABdhPJwvx6d02K8PxUdp0IBb7v1jZD6hUyVgH9tirv5+Schp5te8jRDAZLBlBnXZiWMhKkxKjTdxgR6iE7MjbvucPV0=
X-Received: by 2002:a19:c005:: with SMTP id q5mr9578507lff.400.1605197370534; 
 Thu, 12 Nov 2020 08:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20201112154330.35750-1-dwaipayanray1@gmail.com>
 <CAKXUXMzaf4erZ8Bxe6QbNpRbjXuU61+QE5OS6jkX_Wi5qLJUzw@mail.gmail.com>
In-Reply-To: <CAKXUXMzaf4erZ8Bxe6QbNpRbjXuU61+QE5OS6jkX_Wi5qLJUzw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 12 Nov 2020 21:38:59 +0530
Message-ID: <CABJPP5C5poyCQQWV-oq-KVDuJQ=o-K0gLuSW=qSk1scbpvMycw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

On Thu, Nov 12, 2020 at 9:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 4:43 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Commit extraction in checkpatch fails in some cases.
> > One of the most common false positives is a split line
> > between "commit" and the git SHA of the commit.
> >
> > Improve commit handling to reduce false positives.
> >
> > Improvements:
> > - handle split line between commit and git SHA of commit.
> > - fix handling of split commit description.
> >
>
> Looks good. Do we have a quick evaluation on that?
>

Yes, I had a previous warning dump for 50k commits
from v5.4.

Earlier, no. of GIT_COMMIT ID errors was: 1032.
After the patch it is: 897.

I haven't checked which ones exactly were fixed though.
I think I could extract those commit references just to be
sure.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
