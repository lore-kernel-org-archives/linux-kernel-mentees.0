Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD87C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:38:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADBE247E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Nv63XM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ADBE247E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63E178651A;
	Wed, 28 Oct 2020 16:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BPGqTU0bKgF; Wed, 28 Oct 2020 16:38:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0637686241;
	Wed, 28 Oct 2020 16:38:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC54CC088B;
	Wed, 28 Oct 2020 16:38:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82645C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 63C4D2078D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsW-Rp8pbEgF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 409E52076B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:38:42 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id f7so198167oib.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZrRZnadHOt180RniVeJvE2W7nG/69J3zpKSTsTcGUQ=;
 b=e6Nv63XMTnZ1Nbdzoit3adMr0vkAtFtz+eQVoiHlD1ItQBNRNDX+0c8hXRpg2mHzVq
 HaYXYd7/Fol5n+S8nGxa4vcYgv+Oq3MCTcF8kr5QsaGrGUD+MPG6TJG1PjqIz0LcDLEG
 C/rNeMnq1jHMDckpCpq2QmsvPQ/sOXWsLU+7AocBWLf+I8JkXTDGh2swJE8BaC874+ja
 lM2pVDetOB2eWP+MrdeRE0tnRXdpPJO9Du1cbAarN5P7Mf39DHN7WCUqwJH+wqiz72qU
 mJ0oIsFy19IE0oo0rjXXMy7fqiRE3oVntYbIET2XzVw+OahApY/rqvwxAB0iHz77ZtY3
 ONCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZrRZnadHOt180RniVeJvE2W7nG/69J3zpKSTsTcGUQ=;
 b=WZWkS0EPtJGEP4GTlQ5gGIn0d+K3EVn1fapXDeE3qP4l0gbAlUj0Yeys/PPcNIBz5n
 P+kMqgergG9J5KwDqpqjSgZP5VmJPRbR8QIy1b4fqvhuP3bdgsFCr1siHvAovH0bUZAi
 qeCx0dfodIxp+zsQu2uN0oXM/zh+PnyTVPq3cZThwB5TcTpD4l6sssHsDOsgECOpLTBp
 CaBF5d+zX8qwJsosbP0l3OLMLvQZ9Aq1MvwEyf/ZRcJ4+A9tkxtwzdEP8zgrqV+tCdzK
 9glGDDPz92HfsnKxGxlGWJ44CvG9+x7QQwxJENaG5FakVnVPxSRSa34OWF9fLLFs+PhO
 GTaQ==
X-Gm-Message-State: AOAM531Te1XF2+UHU9BKAhirUWB8p2Df/gD/l0CejCqnvuWb1DjjK+x7
 xI8ZXYtgwm9Z3fKITt8+HWMn+X3H5RhjC8IKNJI=
X-Google-Smtp-Source: ABdhPJwxFhUdNeZpmu8JSjCUjmYsefmQ3gLFIe/9HpgueEqydZ9epakgCKRAOL3YegYCxR0KRhSAs0760ATB+t+Igl0=
X-Received: by 2002:aca:420a:: with SMTP id p10mr163698oia.117.1603903121331; 
 Wed, 28 Oct 2020 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
In-Reply-To: <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 28 Oct 2020 22:08:12 +0530
Message-ID: <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
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

> > Aditya, can you help us here with evaluation?
> >
> > E.g., Dwaipayan takes from v5.4 into the future, e.g., until v5.8/v5.9 or
> > so.
> >
> > Aditya, you could then check e.g., v5.0..v5.4, so v5.4 down to the past as
> > far as your computer and scripts handles within roughly half a day...
> >
> > An evaluation on 100,000 commits is certainly a good basis.
> >
> > Of course, every mentorship candidate can join here as well and show off
> > their own evaluation script.
> >
> > Lukas
> >
>
> Sure, would love to help.
> Just to clear, I have to apply this patch over my last patch right? Or
> do I need to apply any more patch before it?
>

Thanks Aditya.

I think you can apply the patch directly on the latest official tree.

The patch is here:
https://lore.kernel.org/linux-kernel-mentees/20201028152501.106117-1-dwaipayanray1@gmail.com/

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
