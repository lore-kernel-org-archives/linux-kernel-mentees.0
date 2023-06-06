Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2242C7EE24
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jun 2023 14:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D746123A;
	Tue,  6 Jun 2023 14:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D746123A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=Y37Wc0IG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DQbybX-ZNsq; Tue,  6 Jun 2023 14:01:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4227261234;
	Tue,  6 Jun 2023 14:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4227261234
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1908AC0037;
	Tue,  6 Jun 2023 14:01:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B15BC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 14:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DBC61238
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 14:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DBC61238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GYEztD8ohgk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 14:01:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D028A61234
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D028A61234
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 14:01:38 +0000 (UTC)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90FB51E3D;
 Tue,  6 Jun 2023 15:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90FB51E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1686059511; bh=dDuiJtC24VzdW+Dfhr7wI+sSeuZ/1y/CLCgGZYk1WFQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y37Wc0IGEPj2SS76VZrwz5gyRGe+FVQFJw47RA36sbU94kvhIAwWA0QmdJero4UrL
 ZN15FvQkFg84cVKzgWO8IDnsMDFVtsSqoEFkED0lkGCCRxk1EzDBhguE3hsClVBkRW
 SFGicwNFTfAryhHQBaZW7foa4GfKafG/T0RveYVw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  6 Jun 2023 15:51:39 +0200 (CEST)
Message-ID: <fd26e84e-10d0-c4d8-c3a5-0bfbb5e06b88@perex.cz>
Date: Tue, 6 Jun 2023 15:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 3/3] selftests: ALSA: Add test for the 'pcmtest' driver
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com, corbet@lwn.net,
 broonie@kernel.org, skhan@linuxfoundation.org
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
 <20230606133807.14089-3-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230606133807.14089-3-ivan.orlov0322@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 06. 06. 23 15:38, Ivan Orlov wrote:
> This test covers the new Virtual PCM Test Driver, including the capturing,
> playback and ioctl redefinition functionalities for both interleaved and
> non-interleaved access modes. This test is also helpful as an usage example
> of the 'pcmtest' driver.
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual PCM
> Test Driver.

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
