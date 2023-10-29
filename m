Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F347C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 17:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B524984EF8;
	Sun, 29 Oct 2023 17:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B524984EF8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QqvrHR6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQ8DTIP7oasb; Sun, 29 Oct 2023 17:15:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A35DB84EC3;
	Sun, 29 Oct 2023 17:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A35DB84EC3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D824AC0DD2;
	Sun, 29 Oct 2023 17:15:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D48CC0039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EBB4EE13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EBB4EE13
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=QqvrHR6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLBwO3bzpagH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:32 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ad])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D58A64EDC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58A64EDC5
Message-ID: <60109bfb-1850-4b5b-87fd-c47a1e41bc2b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1698599220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSJtfAzcywTSN0h2+pbhBByrfU8Kesmbq2MGXuuxqmA=;
 b=QqvrHR6EfAO/l9ZobJKx78tUZG0j7a7hKp+5+RNA08JP8g4KGQDF1MaIf8MELXrrjBQK00
 PGkc0Uqw4f1t+v3eafFpPIuKOoNbuiecRfjrHt9PZCxX7MDEQsWbmucFMh5fiGSoFuZIbc
 1slJiryqwRKrPyNbZKd+7olkwCkyu8E=
Date: Sun, 29 Oct 2023 10:06:46 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 1/2] selftests/bpf: Convert CHECK macros to
 ASSERT_* macros in bpf_iter
Content-Language: en-GB
To: Yuran Pereira <yuran.pereira@hotmail.com>, bpf@vger.kernel.org
References: <cover.1698461732.git.yuran.pereira@hotmail.com>
 <DB3PR10MB6835E9C8DFCA226DD6FEF914E8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <DB3PR10MB6835E9C8DFCA226DD6FEF914E8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT
Cc: haoluo@google.com, brauner@kernel.org, linux-kselftest@vger.kernel.org,
 iii@linux.ibm.com, daniel@iogearbox.net, linux-kernel@vger.kernel.org,
 sinquersw@gmail.com, john.fastabend@gmail.com, ast@kernel.org,
 kpsingh@kernel.org, song@kernel.org, sdf@google.com, jolsa@kernel.org,
 mykolal@fb.com, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kuifeng@meta.com
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


On 10/27/23 10:24 PM, Yuran Pereira wrote:
> As it was pointed out by Yonghong Song [1], in the bpf selftests the use
> of the ASSERT_* series of macros is preferred over the CHECK macro.
> This patch replaces all CHECK calls in bpf_iter with the appropriate
> ASSERT_* macros.
>
> [1] https://lore.kernel.org/lkml/0a142924-633c-44e6-9a92-2dc019656bf2@linux.dev
>
> Suggested-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
