Return-Path: <SRS0=YTM5=7E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBA8C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 May 2020 22:40:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C55204EA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 May 2020 22:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsppzdI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C55204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CF3E82011A;
	Fri, 22 May 2020 22:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hlr3lABgrAYb; Fri, 22 May 2020 22:40:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1084720022;
	Fri, 22 May 2020 22:40:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0961BC0863;
	Fri, 22 May 2020 22:40:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D93A8C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 May 2020 22:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D585488A47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 May 2020 22:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZW7KF41xHEV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 May 2020 22:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C64F288A3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 May 2020 22:40:37 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41FC1204EA;
 Fri, 22 May 2020 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590187237;
 bh=nKJ+NR8Zq+TjBW09KzQrYnkOO8kcQo/Q4ZyZXpe3MRc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WsppzdI8VXf4M+BwrdzL4O3DYOxOubNAwjRAvieTSPIKz+CS6yRT/m3/MzgOS9dSj
 lGaS9RcFvCS9zR82f/CQg2N/HRzXbW7VjExuBVbkiXeOW5eMgFrY4aAbLqMbQM43kz
 PS0bqCt/sGLzuFnpaw8MSwRBvCuFZseviJZc7etc=
To: Brendan Higgins <brendanhiggins@google.com>,
 Vitor Massaru Iha <vitor@massaru.org>
References: <20200414233753.94978-1-vitor@massaru.org>
 <CAFd5g442ka0c+D+qs7--_ERqn=Bqc3V4AHuER8FLsJi1oesirQ@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <97d1f27d-7156-6207-73ae-fb06d2b218d6@kernel.org>
Date: Fri, 22 May 2020 16:40:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g442ka0c+D+qs7--_ERqn=Bqc3V4AHuER8FLsJi1oesirQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: use KUnit defconfig by
	default
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

On 4/16/20 5:20 PM, Brendan Higgins wrote:
> On Tue, Apr 14, 2020 at 4:37 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>>
>> To improve the usability of KUnit, defconfig is used
>> by default if no kunitconfig is present.
>>
>>   * https://bugzilla.kernel.org/show_bug.cgi?id=205259
>>
>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 

Applied the patch to kselftest/kunit on top of

45ba7a893ad89114e773b3dc32f6431354c465d6
kunit: kunit_tool: Separate out config/build/exec/parse

from David's work resolving merge conflicts. Please check if it is
sane.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
