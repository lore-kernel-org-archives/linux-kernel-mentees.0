Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D12E748E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Oct 2023 06:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD46B41DE0;
	Sun,  1 Oct 2023 06:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD46B41DE0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=f5JndhUw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Btmd9O6kXl9L; Sun,  1 Oct 2023 06:07:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 537DE41DE5;
	Sun,  1 Oct 2023 06:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537DE41DE5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 262E3C0039;
	Sun,  1 Oct 2023 06:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B92F7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 06:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C40C416E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 06:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C40C416E5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=f5JndhUw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_p65ro3u0D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 06:07:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA6F140377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 06:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6F140377
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8544160A69;
 Sun,  1 Oct 2023 06:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E93C433C8;
 Sun,  1 Oct 2023 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696140448;
 bh=HVu55sj8diVEf0YD7PLaNXoZSow64mVKxB6UDNxUVbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5JndhUwISOai3W73L76bzvRwg46SINIy30ZohMcdf2KhyXeqlCr+h0dzVtCpPqUw
 a83j2KMErhppxh2mHOXHKHP6pp/fjrOpkby+HvGO4zoBzJxQMOqJiZ0KLLvsAqc0x7
 J4js6k0JClsUvvOCzD/WzYnCHXSuTPbuN13wjZN4=
Date: Sun, 1 Oct 2023 08:07:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH] Added missing TARGETS in kselftest top level Makefile
Message-ID: <2023100135-stiffen-depress-8121@gregkh>
References: <20230930194106.1379527-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930194106.1379527-1-singhabhinav9051571833@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

On Sun, Oct 01, 2023 at 01:11:06AM +0530, Abhinav wrote:
> Some TARGETS were missing in selftests top level Makefile.Added those.
> Signed-off-by: Abhinav <singhabhinav9051571833@gmail.com>

You need a blank line here please.

Also, why make this change, you are saying what you did, but not why?
Have you tested to verify that these targets were actually missing and
needed to be added?  If so, for what reason?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
