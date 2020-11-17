Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EB4C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:48:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 703172168B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sblOqv1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 703172168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C631386149;
	Tue, 17 Nov 2020 09:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CQHcZOCQYr4; Tue, 17 Nov 2020 09:48:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7518086102;
	Tue, 17 Nov 2020 09:48:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EACEC0800;
	Tue, 17 Nov 2020 09:48:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 385A1C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 34F3E860C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBx96u-MwnH8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1163185D8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:48:03 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v144so29158171lfa.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 01:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlCID2Jkf4Eb6l49WOdJ40OuvTMUHk9+NJpNtZoKMWM=;
 b=sblOqv1WPif+zhjPnBjCdmbtscQxtsuIHz02pM1Gz9hSpo7t/PdSAnFsoIVwBqj72a
 Z+tprwzRLwQIbv5Qxack2E1zN7024UIX70Hwe3La1T4CGaRqztDQbptPJDomN8RisnVg
 797nx+/rsHJWDwbVUoNvzgxj1Tdc8hq82KCx6ozqf6rrPP2oPng3e6XCHFafK0IzIOc8
 2XHzhdnyseDRvLbUV48cVv9dg79tCOKYu8YY1REmyZUM77iHxkOWCxpaci2oGo/1l8Qo
 EfRpp7nWIMPn9qqJ+yCM+vE/XVdXNEwQBFwAHUzE3xcNAovbvJ7dQdBi57I2a9DDuUbb
 VxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlCID2Jkf4Eb6l49WOdJ40OuvTMUHk9+NJpNtZoKMWM=;
 b=ernfJUl2Qwxik0Hs8HKqF5Ksp8Ive2BFdBw1fqpjPNxettO4Z8tPoEd5e7Pd9Gegiq
 5PF5u0optJx2li38OmXBxJnU21+fz+D1P/oiGH5YlCRIIYWFmh8DcQ5CNZU4ti5sX0T1
 mJH8ur0YHBe7pNuP6znbO8BYCVDbGXfATirAehUGqhlkrPL8FvBW3zWOQL65Oy4ZsZX9
 gDgVVUhWQ8ZKpdtFL1VgGwEtrfZ9cBzJzmP/yWrquoJP/DcZblUNTuIUhXupmSJES0zc
 TmjZsepQy2e8nfQ/QL4P7OTM5ImVaGeK7FIs2gQiyTHh2RgHg/fBH/g7LhaVgrX+yRv7
 O80g==
X-Gm-Message-State: AOAM531sGZ4qUxTsA0+r/c6zYWlmrv9C7DG4E9pMs6Gs/QaXPQgdpNmM
 Em3Ak6PPVJnl12sXFvL9u9XHgMabfbl15r5mc7w=
X-Google-Smtp-Source: ABdhPJzbkz3oztTsVNqZjZt3HJ6X6haghDwxYTEkMjWLsuXNlEo35kzgOswM5HG+r9+t36CWgChs4PPxTMEdTvogtwQ=
X-Received: by 2002:a19:5c8:: with SMTP id 191mr1336188lff.111.1605606480899; 
 Tue, 17 Nov 2020 01:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20201117085553.52583-1-dwaipayanray1@gmail.com>
 <CAKXUXMzM8AYPWkCKXnTRQG-a03Jh+HDCF=pGAjEsg9ah0odG2A@mail.gmail.com>
 <CABJPP5AF2W+KEsKrQOeL9g1TpcCfsfOfRRmVygEQypdcYsZiXg@mail.gmail.com>
 <CAKXUXMwaW72AQdLwX8D0d_UfT65qjZABBC+OMor3w92eCOgQ2A@mail.gmail.com>
In-Reply-To: <CAKXUXMwaW72AQdLwX8D0d_UfT65qjZABBC+OMor3w92eCOgQ2A@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 17 Nov 2020 15:17:29 +0530
Message-ID: <CABJPP5CgDsR=mFar1fm-nF7Pgd_eVb-WUGDz4KKEuaC6mqBKRQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

> > I have only run on some test cases I made, which also included the
> > style misuses above. Finding files in the kernel for this exact check
> > might take a bit work. Should I do that? I think these custom examples
> > pretty much handles all the cases.
> >
>
> Well, it might be helpful to also submit some patches improving the
> code to see if the cases where it would trigger actually fits to the
> expectation of the maintainers, or if they intentionally have a
> different style in mind.
>
> I think it is worth running checkpatch to find such cases.
>
Okay thanks! I will try to find out some of those.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
