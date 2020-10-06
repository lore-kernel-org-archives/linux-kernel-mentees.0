Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6122BC41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 19:01:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0030206A1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 19:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYCtXI6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0030206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 577E785DDB;
	Tue,  6 Oct 2020 19:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 692eWDp6WGXl; Tue,  6 Oct 2020 19:01:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D89685DD8;
	Tue,  6 Oct 2020 19:01:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56433C07FF;
	Tue,  6 Oct 2020 19:01:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2BF0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A43D920554
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMGEbqhT0xKJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 19:01:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id C2F3D20372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 19:01:32 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m13so13322656otl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSymH4vd/R57ZcKC0GdaMdmbsJkR/uPBbSzo5j6VwGI=;
 b=WYCtXI6u/py4vSrocw3RaLLovCI1JxT5ISmnl3Cx2aVM2XY/kv/f/+IV2MEz3qejW5
 CstYX+nDT2/lYjGF+onBkWGgL1k6jRJjbXI9H/t9kHWAgJ4DREu1VWnA6y98qyulp4Bc
 5lh6t4bbo7XH9xKRzR/Zype2yl63f+eaLxFnME3uk7+llKI7qurGMhBkoMYADAe0dVxw
 +QTYra5wUEtSupM3LdA5JkStECMvPIH4cGJatO3we+aNOGspa/mu9k+v5kA7zEHJ1Nbw
 6Olm66WRO5BGRZ2MgDfvfk8QexwDVH3li5Wg4sMQA/YCkngCl8j3NA60NN6UFy+U9RJS
 1Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSymH4vd/R57ZcKC0GdaMdmbsJkR/uPBbSzo5j6VwGI=;
 b=rasfatUdNOOIA/G733W9U/VzTIIJaTxVRmnJhSIwlPguY7LvcQtZoV3Z6EtJDQIyoT
 CrcGetfwd3jXBuLLA13mqLU3NzeN6U2UDjJozKBN4jN8TZazY2mypPFzXP2WfWtiWOcX
 zWJBULN57D1IvlEgZgr75+s1ArxDhHwLVSkD+MFH2fAi+EVsRKyPD8CFFjlhnF/rqBe2
 PPG0Ps4UZ39DqiuDV/h/LRIq+OcX+TL/CcOWNBMTs0alLu9Macpj87OYya359K0cHMrG
 4LNhMRKzIGEXbDHM415GG1E8DYjWVkBWMnRi7pv9m9fQrZKt8GoYjm9De79Ief4uhHOh
 SPag==
X-Gm-Message-State: AOAM5310omZ4FYmFvu5zGmQPbMULcA/YbUJyrwXD84dLHs3jnz9cN+ZA
 5+HkgUU4oQT/H85T7TYXRwJnu2Bl9gbn6hnh7jM=
X-Google-Smtp-Source: ABdhPJz9lz/9PlcW/fDp6CK8frwTEfGJVwHqpkf+vqobGR9FlivLWUs9JnrTHt/RdlwgWZLE8PY/RWYaA28brxuUdl4=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr3709804otf.265.1602010891747; 
 Tue, 06 Oct 2020 12:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201006185114.168358-1-dwaipayanray1@gmail.com>
 <8553d6679f97ae9d285a9ffd61198f5e3c11dc35.camel@perches.com>
In-Reply-To: <8553d6679f97ae9d285a9ffd61198f5e3c11dc35.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 7 Oct 2020 00:31:08 +0530
Message-ID: <CABJPP5Awe=CDC7riYBBVDf9WRO4aAMXK2QROYdtGyJXNjqB-ew@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add new warnings
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

On Wed, Oct 7, 2020 at 12:25 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-07 at 00:21 +0530, Dwaipayan Ray wrote:
> > The author signed-off-by checks are currently very vague.
> > Cases like same name or same address are not handled separately.
> >
> > For example, running checkpatch on commit be6577af0cef
> > ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> > gives:
>
> Aren't you still missing emitting an message for cases like
>
> From: "J. Random Developer" <jrd@bigcorp.com>
> [...]
> Signed-off-by: "J. Random Developer" (BigCorp) <jrd@bigcorp.com>
>
> Where a comment does not match?
>
>

Yes, messages for comments were not emitted previously too
cause the same_email_address() function just matches name
and email (discarding name comments and email comments).

So should I add it to this patch, or should I work on it in a different
patch perhaps because it involves change on another subroutine?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
