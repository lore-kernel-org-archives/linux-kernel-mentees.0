Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5421DA37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f7Pyf6Rn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF44411C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF44411C6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f7Pyf6Rn
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebdMeyL3_S8M
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 20 Nov 2023 15:44:13 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [IPv6:2001:41d0:203:375::b6])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A5FD5408FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FD5408FF
Message-ID: <ebecf482-d785-4d8e-84a3-eb0bf901cdb6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700495051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIUeiMgZscjp06DUtT53KHCOHBj10yoOgIx/xPQe91Y=;
	b=f7Pyf6RnucUbwXKoCt1CBBuZKgLm79UXGYY7eChKJcAyYkjG9UbEFbVp9CO1S7x4fusI5N
	HvqkmuuXXmakngXF91stpsTGzF1ICZu6BMLeGGVbfKAEo5FbeXMNDvzuDP8MF9zxrOfH3m
	hi9B3jpESyZ0Qr7W70pkcpvZjLdNz4M=
Date: Mon, 20 Nov 2023 07:44:05 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 4/4] selftests/bpf: Replaces the usage of
 CHECK calls for ASSERTs in vmlinux
Content-Language: en-GB
To: Yuran Pereira <yuran.pereira@hotmail.com>, bpf@vger.kernel.org
Cc: andrii@kernel.org, andrii.nakryiko@gmail.com, mykolal@fb.com,
 ast@kernel.org, martin.lau@linux.dev, song@kernel.org,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <GV1PR10MB6563AECF8E94798A1E5B36A4E8B6A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB656325F13ABA4DBFD4663C33E8B6A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <GV1PR10MB656325F13ABA4DBFD4663C33E8B6A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 11/18/23 1:47 PM, Yuran Pereira wrote:
> vmlinux.c uses the `CHECK` calls even though the use of ASSERT_ series
> of macros is preferred in the bpf selftests.
>
> This patch replaces all `CHECK` calls for equivalent `ASSERT_`
> macro calls.
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

