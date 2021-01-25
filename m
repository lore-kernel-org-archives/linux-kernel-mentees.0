Return-Path: <SRS0=F5qy=G4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCBCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 08:57:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D02522D73
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 08:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D02522D73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFC0127400;
	Mon, 25 Jan 2021 08:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MofbNKMD0lup; Mon, 25 Jan 2021 08:57:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 368E9272F5;
	Mon, 25 Jan 2021 08:57:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 122C0C08A1;
	Mon, 25 Jan 2021 08:57:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BFDEC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 08:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07D148739C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 08:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-kLDVcYN6nS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 08:57:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF32487398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 08:57:35 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 3xgdlSZ5liWRg3xgglfVNP; Mon, 25 Jan 2021 09:57:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1611565053; bh=Cg0C444tQm28uUmnFYRWQssZ7i1ibjFWyLPPzyy9tOA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=PxLoKjfLxlVxiT7amVhnTQKWwqMpx9kilhrqSZVbbHK3SQGJ04xBpuxt9wM31dbbT
 qw4BK+hM8CqK6wuss0lp2HtwC4gBxgfG6pIEl0K90PzKFh6GzyVe0XywMPg0A1BpiX
 EIwivR1qrDQWlbtK22Z+bZKA/JPcjXLyOqNUpOnvLCxu56I3pbGY2VSAIyNxXms2H6
 BRWvLa2u1JCoA0xArBr+Ub8FJTeLtv6q+Yg8W4DNucHLXg14gS/iu1t76LY4RYkmdw
 q3my25p2eoQSnbhGpgliE9O85ydruyFWtE53kJ201ygwopG6RdK8ENDZuXQ+QtSxGg
 BY6wmooO1TrVg==
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <46584ea9-81ff-a3a6-2853-fade654bd2fd@xs4all.nl>
Date: Mon, 25 Jan 2021 09:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfIrhUs8azoJXXgV3bGWciye9in8e1NG+Is9X14KzRn8mqJAM1/A5uzLnjfC5Y/iuHO6g5KJ4/WEMnR5m+f2xXKSKJ9m2jYwquUbPDKKnptPljMxO+8EV
 xTzVFVE56QqHzLRIgif0r8Gf1qGx3nSCmtg9VVQjMSLkx0x/rlW+MCKp3dw/YnvwERlRJNR70B8/WWnI5NkfIT7O/PGmrhXA1JyLX8hOJlY8VToYqrx6+H4J
 3Ki74U2LcWqaECUOU2hUgTQIggLenAYCS/W1LmLYgLnjltqIld1RBnR+SA2uQu4cGfr8CB+EYZkcbT1ieT+et1IhgXeEwRo2zMwyAjMdt7oJ2sg/mmRB1sJJ
 kguX04RnlUZA4GWMyfRO+C86e+vcGg==
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/4] media: vidtv: add media
	controller support
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

On 05/01/2021 14:09, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series adds media controller support for vidtv so that we can
> support this driver at the test-media script in v4l-utils.
> 
> I based my implementation on vim2m's.
> 
> Daniel W. S. Almeida (4):
>   media: vidtv: Add media controller support
>   media: vidtv: reinstate sysfs bind attrs
>   media: vidtv: use a simpler name in platform_{device|driver}
>   media: vidtv: print message when driver is removed
> 
>  .../media/test-drivers/vidtv/vidtv_bridge.c   | 32 +++++++++++++++++--
>  .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Mauro, it would be very nice to merge this. It will make it possible
to add vidtv to the test-media script for regression testing.

Regards,

	Hans
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
