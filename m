Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8CAC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9156541049;
	Fri,  1 Jul 2022 14:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9156541049
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=ZiDJF40Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMEvyoSQB8uD; Fri,  1 Jul 2022 14:30:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 91DB040AED;
	Fri,  1 Jul 2022 14:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91DB040AED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A4B9C0032;
	Fri,  1 Jul 2022 14:30:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEE64C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 764CA84737
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 764CA84737
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=ZiDJF40Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjTqW4gGCKFt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:30:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B98384736
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B98384736
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1656685799; cv=none; d=zohomail.in; s=zohoarc; 
 b=WytGit7/VJVzWYVcDuphLiPxX5pT2qBET0QJ9Dd0CLbcFUG7LhWniefl1jAX4d3XLFkbsJTep5InNU5XVdGR1RC57jHOvXlbPt7lG3ukDuFiiu9u0ARs8x2VnVEqztUi++8ZoHknudjQSHsCZd/RdtFFZHJJKsamFIo1gAVLkiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1656685799;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=afITDBJUJm7jKiQgATQjaUMg82FcalVO6iB2x0vBPY0=; 
 b=CKwYabmYsBX/aJg2XDvQkmu3dczm8sYcRIBlt4+/aAcp1BBtmkeTbDQpOEYfZ3Rxg3FqG9DBqHDgqOcSUJTJN8+hrH8BafHgvePMU8GLnV7fxGLYRITx65S/StNpVR33QErTujJYLRjPu9tj2U+t9ogckaPNPgGwTNB5tATZUB4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656685799; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=afITDBJUJm7jKiQgATQjaUMg82FcalVO6iB2x0vBPY0=;
 b=ZiDJF40QzmHiaKP/ALzgvMTGJNMhVWGK8k5Bin2QCm5HLU92J5mSo1g7p1zBZFDW
 gbPy/LDQDWGnD7LBXzjb62hKzp0JQ59+6fRqVf92uHGECViJ8NKbtfI0R5hLzoidBl9
 TwpiKT5AvTK/Rhskt++Aq8A/JeD6H005atm5OK2E=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1656685787788483.58861760110744;
 Fri, 1 Jul 2022 19:59:47 +0530 (IST)
Date: Fri, 01 Jul 2022 19:59:47 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <181ba2afa51.7d123db0789809.1834230085722405669@siddh.me>
In-Reply-To: <390aca1b-3b48-e0c1-07a1-ec8c29f0b8af@linuxfoundation.org>
References: <20220628064621.14427-1-code@siddh.me>
 <390aca1b-3b48-e0c1-07a1-ec8c29f0b8af@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add tools/testing/crypto/chacha20-s390/
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, 01 Jul 2022 05:30:27 +0530  Shuah Khan <skhan@linuxfoundation.org> wrote
> Doesn't look like you cc'ed the maintainers - please do and resend.

Sorry for not doing so. I will resend now.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
