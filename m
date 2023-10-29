Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA236C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 17:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA694EE64;
	Sun, 29 Oct 2023 17:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA694EE64
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XQbDmpBO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_0M1aNQoQKf; Sun, 29 Oct 2023 17:15:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 306ED4EE13;
	Sun, 29 Oct 2023 17:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306ED4EE13
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B49A1C0039;
	Sun, 29 Oct 2023 17:15:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24D12C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE8C984EC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8C984EC3
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=XQbDmpBO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26uOlv0q9qVN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:32 +0000 (UTC)
X-Greylist: delayed 508 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 17:15:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89D884EB0
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [IPv6:2001:41d0:203:375::aa])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C89D884EB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:15:31 +0000 (UTC)
Message-ID: <1b463b8a-eac0-4894-b265-da1d3e51c674@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1698599269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwjmesJBPd77RraX0VXEJ5fpmp3TmiDHUFN/EhxgGxI=;
 b=XQbDmpBOLN53bjspOhw7G4X/xCSZRhmYT6bEkgzQPOdJunYr9MryJGIPcEh+IqVd7xcMBO
 yQDcR7W+7lzew3Fqf6oH1O8YsfSoVeHubyMyd8WtA58cBWSly5DedTyPSSpnnhx4LiaCCZ
 wuToRNnwdmOb4VSSDe+mmdFeStEb5JI=
Date: Sun, 29 Oct 2023 10:07:44 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add malloc failure checks
 in bpf_iter
Content-Language: en-GB
To: Yuran Pereira <yuran.pereira@hotmail.com>, bpf@vger.kernel.org
References: <cover.1698461732.git.yuran.pereira@hotmail.com>
 <DB3PR10MB6835F0ECA792265FA41FC39BE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <DB3PR10MB6835F0ECA792265FA41FC39BE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
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
> Since some malloc calls in bpf_iter may at times fail,
> this patch adds the appropriate fail checks, and ensures that
> any previously allocated resource is appropriately destroyed
> before returning the function.
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
