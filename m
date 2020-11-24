Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5C5C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 07:44:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B97B20659
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 07:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/S76T8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B97B20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D2F08204CA;
	Tue, 24 Nov 2020 07:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CV4pUtI9TJQx; Tue, 24 Nov 2020 07:44:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 05C162041A;
	Tue, 24 Nov 2020 07:44:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DED35C0891;
	Tue, 24 Nov 2020 07:44:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A82E6C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A45F184D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZIniNRHIUGz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ED1C084D0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:44:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id t8so20905933iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 23:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvY/zTM2h4wL/LpgmgYVY5tAEx3mPbdJuEvi9xauaCQ=;
 b=p/S76T8vOP8S23e7I2kPiCmG/Z6NFpUrkUZUHwFIjBjTn460LCKD3FwoJUaz7d3nIs
 v/x5jO7vVNFYLMDaJc6EGmh2JZKVArv4Advo/irL8slY+dBxBFm5L4M2yMLO32rhJ5jn
 zbcLtx1HyLYTUjRdb4GHJ4adYerXc/lNNWjDDUTLCF+YHSuqomgYPiRJcT4fRwC5WL1p
 f55Zjx59m+BFe0AT8mlI54U2ZDtNHuqTmElRcHif5n+9i+a9rsqG9I30cKkt4RIFAymq
 adeGM3KU5b64wcfL2MwrcWQFwC5zV1IYt4f62VpbObIGoboyK9giGfXfhJJAmmvCMKRy
 aGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvY/zTM2h4wL/LpgmgYVY5tAEx3mPbdJuEvi9xauaCQ=;
 b=itvAl3wq7VTMunOPKr2qYG1b94V91Jx+/Ufa+atECtTTb3HAnpPj7W/8ZQkcifU93Q
 N12HQ84CUn0lGJ96g8KYl2aMvOWyQuGb301iZyUAiB0ryC40el6nEaTvPoJRZyqLtXo2
 P6Eln4vpx4B7GNKJD4vsxHjoPu1LCPfmDUnGc9UbVecW/TBd1k5A49FouTLGD/QusCrJ
 VUChPk2NWmmUlIopIfODJ9OCGLwB+8xesFlxfAFwl9DTuj37pZH36XbWqn4W1qGYaalu
 308O42kU5MRxAe5LoHJssk2OtO2R168/D2D9nkt1suwaITp20x+QNOWvgmZQPfjJlKz4
 CpbQ==
X-Gm-Message-State: AOAM5321V890Q14yMjKr5DFLijqxmQotQVV/B1tNR3diWQ0OaWgEi5Bv
 ci8MAr2bcWZ0RagoQC3DGG0rJYuaB1X67CEj75Q=
X-Google-Smtp-Source: ABdhPJzithm4YuKGHNGewOo/Bui7kn2ZGersM7beMqUzIsNGnvuvyD7renM5aBK8Eaa63mt4Fhr6+G6W7vFsU7jDjr0=
X-Received: by 2002:a02:ba90:: with SMTP id g16mr3374625jao.96.1606203881169; 
 Mon, 23 Nov 2020 23:44:41 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
 <20201123172430.12854-1-yashsri421@gmail.com>
 <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
 <CAKXUXMzcMWeM2M81b2PZ+D54LO6xd+m667vygWVF93Mnsq8QQg@mail.gmail.com>
 <8f6f634f3c4e079fd16922f2dd1109f2974319b2.camel@perches.com>
In-Reply-To: <8f6f634f3c4e079fd16922f2dd1109f2974319b2.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 24 Nov 2020 08:44:30 +0100
Message-ID: <CAKXUXMx599Y6oJ_XBJCNbuFnoU0MzsiFzENhnD3nN6D4tYj+aQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Tue, Nov 24, 2020 at 8:26 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-11-24 at 07:54 +0100, Lukas Bulwahn wrote:
> > On Mon, Nov 23, 2020 at 6:33 PM Joe Perches <joe@perches.com> wrote:
> []
> > Maybe a patch reduced to the very obvious synonyms helps newcomers or
> > people with lousy memory to be reminded that it is called
> > "Co-developed-by:" not "Co-authored-by".
>
> I have no issue with proximity matching for nominally invalid uses.
> I think the method used wasn't great though.
> For trivial spelling defects, levenshtein might work well enough.
>

Yes, that is true. Aditya has actually created two patches, one using
some edit distance to find matches and one using a fixed match for
those cases (the one you see here). Both patches complement each
other. But he has only sent the second patch to you yet.

I guess when the other patch is sent out, it is a much clearer full
picture how this fix option will work.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
