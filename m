Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E10C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jul 2022 12:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBD3611ED;
	Thu,  7 Jul 2022 12:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CBD3611ED
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=hwnc2GD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1bEAUvnXLI3; Thu,  7 Jul 2022 12:00:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 17256611E1;
	Thu,  7 Jul 2022 12:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17256611E1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7AD5C002D;
	Thu,  7 Jul 2022 12:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B711C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 12:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D5F481970
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 12:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5F481970
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=hwnc2GD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pGGt6rRicex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 12:00:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB6D983F9F
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB6D983F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 12:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1657195193; cv=none; d=zohomail.in; s=zohoarc; 
 b=UXI3yFQQYQvAHbcwU47b2aV4XPVAOEmMMlZDYyLASHbsDrCE5eX9BYx9CQLwZCa1w5FA55qJKDendi/Q1QzoIsDk2PuqtHlEZmvuX15YaXhoRVo97G2MgOStTUrI7wn/c3EQ+EtMmbdQc6OnDDers1RSnKW3aSUskKZce1MMBpQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1657195193;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9oIIAaHxLVDhvrlkTzyijBA4VZ4czewxEi1HFtBUOug=; 
 b=Zo2xUH1iOtOefPSmYk0R9mLo7SNeXJoY3enHcHi/BfaabMulQlKyM4FPaTs8k9HA//uucsMzonvLgm2V0vfylypzJJqFWa8jr5R+elmh4eL6f6OZnV1PEG8Kp4PZ9jd4L1ItoFp82qGOCH1qsVM3QiI5FxTAOmpS+g+dUqEaryQ=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657195193; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9oIIAaHxLVDhvrlkTzyijBA4VZ4czewxEi1HFtBUOug=;
 b=hwnc2GD2S72yhNd+NMB/+XXsMH1iMdOo2ao2ky7s4lHQaSwHhwhBx8lfrARdu7Wa
 RvrhAU86lvXXIJ8e7JjhdYC1E9m7Garllc9b8Nad20DVzzYPHSGHkEcTtfaKdTF0mHm
 LeBDy5Jx95cQxV4OJKMpj5jFumgmc1e6XrMNtw4s=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1657195180973536.7531988269672;
 Thu, 7 Jul 2022 17:29:40 +0530 (IST)
Date: Thu, 07 Jul 2022 17:29:40 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <181d887b398.167dab1d11045.9186448565104273580@siddh.me>
In-Reply-To: <YsbIoB5KTqdRva6g@kroah.com>
References: <20220701145423.53208-1-code@siddh.me>
 <181d8729017.4900485b8578.8329491601163367716@siddh.me>
 <YsbIoB5KTqdRva6g@kroah.com>
Subject: Re: Ping: [PATCH] net: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, 07 Jul 2022 17:20:56 +0530  Greg KH <gregkh@linuxfoundation.org> wrote
> On Thu, Jul 07, 2022 at 05:06:35PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> > Ping?
> 
> context-less pings, on a patch that was sent less than 1 week ago, are
> usually not a good idea.  Normally wait for 2 weeks and then resend if
> you have not heard anything back.
> 
> good luck!
> 
> greg k-h

Sorry, I never intended to disturb anyone.

Thanks for informing,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
