Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3015C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 04:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F616F925;
	Fri,  5 Aug 2022 04:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F616F925
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m1f9V8o3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcLozM9GQHf3; Fri,  5 Aug 2022 04:21:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 156006F90B;
	Fri,  5 Aug 2022 04:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 156006F90B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C24E2C0033;
	Fri,  5 Aug 2022 04:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31765C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 04:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 057948329A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 04:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057948329A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=m1f9V8o3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpvlcb9zozvH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 04:21:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B60283264
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B60283264
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 04:21:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CEE65B8275D;
 Fri,  5 Aug 2022 04:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC41C433C1;
 Fri,  5 Aug 2022 04:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659673271;
 bh=IDgm74XCW7agRV4h7Bb9bHSULjnnigmzvUl77NFsex0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1f9V8o3YN+FSl4bBIRRaGIzHK2FgQM1wVUxuVHv55kbRPpKqRO6umsEqs+IG0d5S
 VrwOPbcz+N/a1l9Abhz2kfJEetOeYRr5Q8xbHAZes6I2ZZgya3rU68zqx+GVKHU9VC
 akRg7br92/QVoDH9nv9DXOGMehUhd1d51+z34RPI=
Date: Fri, 5 Aug 2022 06:21:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Subject: Re: [PATCH v2] media: dvb-usb: fix memory leak in
 dvb_usb_adapter_init()
Message-ID: <YuyasvdntQp4mEt1@kroah.com>
References: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
 <CLXMEQRZRKJH.196H3FP8VFR8B@Arch-Desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CLXMEQRZRKJH.196H3FP8VFR8B@Arch-Desktop>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, mchehab@kernel.org,
 syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

On Fri, Aug 05, 2022 at 02:07:51AM +0300, Mazin Al Haddad wrote:
> Hi, did anyone have the opportunity to review this?

What is "this"?  There is no context here.

Also please realize this is the middle of the merge window, maintainers
can not accept anything until after -rc1 is out.  Normally you should
wait at least 2 weeks before resubmitting if you have not gotten a
response, but during the merge window, you should wait a bit longer.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
