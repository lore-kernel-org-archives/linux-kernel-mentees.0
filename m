Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7AFC001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 14:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0683182D40;
	Mon, 23 Oct 2023 14:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0683182D40
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jSECD4wA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQ1yHCNtLZZM; Mon, 23 Oct 2023 14:19:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1DE7682977;
	Mon, 23 Oct 2023 14:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE7682977
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A998C0071;
	Mon, 23 Oct 2023 14:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0B2FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD05882BE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD05882BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26g8veYv68T4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2443C82977
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2443C82977
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0C1EAB81E17;
 Mon, 23 Oct 2023 14:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF6C433C9;
 Mon, 23 Oct 2023 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698070747;
 bh=wLIy1aefQ4yhPBXOUHP6N6N5h16eUxi70U54zf14d2A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jSECD4wASSCL7oY68tn8qcx6oln6oYy1ZxEnvAJI1xnZESdsiwCidSTRatyXtnMZT
 npKxW0s+xXT1+Tqb4bTUgby0ZxrDZ5AVzLm+09XTOC1iXc0Q80hzQ0ve3IWS3/2X98
 v98oSgjiUN1nsLi73bn/6M97Ynw25ryU3HVhv1jNx8GA4l4e4aWXbfaCrRImVk+BG/
 U5p7YhpQ8SXIB1z8ti+C/9jE5WWSW6frwXxZGWL/ymHqNPh0OHjYr7du/IruudxXjs
 Ye6HCZefSYBT+6uW3ZVXWHTXhCmdBDJsm8q5FSVDDZUp5FShLMrt5sGrBhNa35MOi5
 lNZ+xLIamUQSA==
Message-ID: <f22a0a5b-2813-4c59-9d30-af9f87a2f5aa@kernel.org>
Date: Mon, 23 Oct 2023 08:19:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:net change ifconfig with ip command
Content-Language: en-US
To: Jiri Pirko <jiri@resnulli.us>, David Ahern <dsahern@kernel.org>
References: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
 <fde654ce-e4b6-449c-94a9-eeaad1eed6b7@kernel.org>
 <ZTYc04N9VK7EarHY@nanopsycho>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <ZTYc04N9VK7EarHY@nanopsycho>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org,
 Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/23/23 1:12 AM, Jiri Pirko wrote:
>> ip addr add ...
> 
> Why not "address" then? :)

no objection from me.

> What's wrong with "a"?

1-letter commands can be ambiguous. Test scripts should be clear and
obvious.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
