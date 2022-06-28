Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE91C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 06:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96AE60C1D;
	Tue, 28 Jun 2022 06:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C96AE60C1D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=Q2r6U/xx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYI0lNPwZLSO; Tue, 28 Jun 2022 06:42:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9D06160C0F;
	Tue, 28 Jun 2022 06:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D06160C0F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76058C0039;
	Tue, 28 Jun 2022 06:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75C8AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C55414C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C55414C5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=Q2r6U/xx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zde9vjShsVRF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:42:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08862410BB
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08862410BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1656398523; cv=none; d=zohomail.in; s=zohoarc; 
 b=cX/cZrKhxSx/PKbMF4/oKQ+jsDcIg5Z6kNJX8n0IDf5eoILUo4XN4qwVIndzTDsDe/JmlvcBbzbeUq2lIKciWoMVctF6QVnZKYcA45zaXN7zkXtYmCT2AjYvbchPth4oXTiNcJEfHnKJ8ijEadwMDgzEBSjX6OIzcg0uP1Da+fI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1656398523;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=pwBhxQsXM2xG4XBvZsefXNn9UjZeDWvvFqvWTEAn2+k=; 
 b=I+7e84CO/imSIuiyvYcjjaMt2PDywcY+V+neYAa0VUtQVy9YCrwoqT5+6GbH3GLmAVKg8yjwZeun44LkDPPvJiWg3TAWIumeSuBWZN3f2b3y9vDkPVTBHDEYVCs7Sg5DBovbFDT4IPl5LST3SHlrW/UIVsJdN8Gkr33Q/JmzFRk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656398523; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pwBhxQsXM2xG4XBvZsefXNn9UjZeDWvvFqvWTEAn2+k=;
 b=Q2r6U/xxP0t/Br9OPEB6X/3n9JFP7ExaILQIptzBGCJULMyrdV3gageLcCUup81H
 rIbugSNU0xW8BAgSHGj1IffTAjFhYuNaFwBuzb/hCfhwDkI3EDZsuPLCuJjO0tXaHw8
 9QGe2bUB+fRuH0PBZwLRGMxEj1cn8cuFSBQiZrPo=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1656398513098179.83531316121014;
 Tue, 28 Jun 2022 12:11:53 +0530 (IST)
Date: Tue, 28 Jun 2022 12:11:53 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Vlad Dronov" <vdronov@redhat.com>,
 "Harald Freudenberger" <freude@linux.ibm.com>
Message-ID: <181a90b83b6.ba9fe3d538365.4289053582876165476@siddh.me>
In-Reply-To: <CAMusb+RDvUG9ZmSH0cxqJAXzniDDihsuaWhKu7M8bchatcuUSQ@mail.gmail.com>
References: <20220627075148.140705-1-code@siddh.me>
 <9f79f8edfa8f7c5099b842f020782ac2@linux.ibm.com>
 <CAMusb+RDvUG9ZmSH0cxqJAXzniDDihsuaWhKu7M8bchatcuUSQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools/testing/crypto: Use vzalloc instead of
 vmalloc+memset
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Kernel Mentees List <linux-kernel-mentees@lists.linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, 27 Jun 2022 16:26:12 +0530  Vlad Dronov <vdronov@redhat.com> wrote
 > Thanks, Siddh,
 > 
 > This change makes perfect sense.

On Mon, 27 Jun 2022 15:24:46 +0530  Harald Freudenberger <freude@linux.ibm.com> wrote
 > Thanks Siddh
 > I'll forward this patch into the s390 subsystem and on the next merge
 > window for the 5.20 kernel then it will appear in the upstream kernel.

Thanks Harald, and Vlad.

Apologies for not CC'ng it to the s390 mailing list. The MAINTAINERS file does not
have entry for this file. I will send the patch for it.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
