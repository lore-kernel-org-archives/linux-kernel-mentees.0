Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD50C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:24:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B2D206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aV5/FzuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B2D206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A134087D6A;
	Wed, 14 Oct 2020 09:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykJV3p6T0vwf; Wed, 14 Oct 2020 09:24:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4830A87D3F;
	Wed, 14 Oct 2020 09:24:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35A34C07FF;
	Wed, 14 Oct 2020 09:24:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B955C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67B2987D6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPIcFew9TAR8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:24:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 90B8A87D3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:24:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id h6so2937719lfj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mkxHm5smRfDO1NSeLwP/Z67MTDrclYIyUblxSrjuLk=;
 b=aV5/FzuZxqbzxjN0zM8y7pNDFT8r6sBjZroZHksZRkBuUwqWpatvWtM7apNk9SWvS3
 YCv3ZhcFZ7wfQY8WBG4Q2+lGjAwPeYYxE3VZiLjRzQvJovIf+ZTLDgZ+KVZ9zmAKIKep
 y50+AAuGWrvgxT3eNfvvKB1C3nMeGa/aX1OvWtZcE4VuheAK0kPanjj1Ecr/Wsd96XLc
 AiqgWq0uh4N8q2UQ1IA0B55CU9mWnL9VHoWtUpcAB6fGSqr9pYaiNmqRwq1+WURhhM6v
 ZNDW5yd8DqyLykkZ4QqI1p7pP8go1dTyEqgspk6a1OsvjmBUrUW8QxcZZeltuSkIxQKt
 wJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mkxHm5smRfDO1NSeLwP/Z67MTDrclYIyUblxSrjuLk=;
 b=hzheZeBpUS6rBunJ0Vjxw/9cordkPYCo4eNgOufLL2UHTX8I6tgmyGNDwqxN30pmq/
 LZFXkuw69YTALfUGxxklqwxLNfkqOPdXtpTrZTgJpF+jumQ71duqk7AkrYvKMnqdxcWZ
 UTvrM1uDg0mL+yVLKrpyzqtwZa566F711yiaouc2/2Hj5FBLfeeFb5S5pdnQ5FB077ik
 vj7m92oKMo1K35eTD2pqWt4o5WTx+xIqjZE3rLsYIpO5dBkkDdPS+td8hzUrDIztgQG5
 sxkNLgToXLdWlV3jUNuyHdupKIBY/7Wst3V/pxkom5fxSPaj0/U42ZMiMvvD57xm6mUq
 chwQ==
X-Gm-Message-State: AOAM532zPjO8xTW+z7daCQhxumG1AsRCAJaQRPC50hkhTAkW0n6lvIn5
 hp4OshB2Vojhw4zQ2ZME6KW2/oQktcY3uttR7u4=
X-Google-Smtp-Source: ABdhPJwY7jh8nESOhT7+HNk4H4U3o+oOKvFoCX4gb93fN295GmYdslLDY2EpKx8zINrXoiTPYRuqRNDrjm96QRBhRds=
X-Received: by 2002:a19:be86:: with SMTP id o128mr1001963lff.220.1602667463843; 
 Wed, 14 Oct 2020 02:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
 <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
 <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
In-Reply-To: <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 17:24:13 +0800
Message-ID: <CAC2o3DLN4T9NoRfseQ6KJbxaGpeX1VQry59N6SELCOOJmtBZMQ@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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

umm, bittersweet  :)

Thank you, I'll check it out.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
