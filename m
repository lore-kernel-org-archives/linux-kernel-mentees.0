Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054514261
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsAhRyD8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA9561075
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA9561075
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hsAhRyD8
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4aWWEyr-tVC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 10:51:00 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1BD9F6104A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD9F6104A
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc13149621so14517045ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699440659; x=1700045459; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bt2bvDjEv0HiaQYd0c4TjFAx6Nfzvf1eIcmbOTXqPwE=;
        b=hsAhRyD8Wl5YNQKbS0T6VDQlyudtYAvu2ywvGbI2uIm0Z29+LQIOLZevDnU39xtj1/
         E5B8KNu0YxnUb3N9CvX7uX5MsSgGRw6MIKxnLDFfDGgBjHU9iOR4al9tlA57F5H2VHNT
         Afswm8HZkAYGpgsseW2dSygrJv/bQi6Tfx6/3Q9IW5yoAJSE3npAr2MqtLml5I7Cg76k
         zWb34TcFIyARqaZFh34t/ZaEvKd0Lh4pQSEerbei5gFSk4X4VvRWUTqJLB3MUIC+i0Ln
         i767X0PVfH5oGmvkzAleV935xFg6B6MacKyj7Nme9KMdwF/KbSiNwA3w8wSYBYjqBla1
         7CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440659; x=1700045459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bt2bvDjEv0HiaQYd0c4TjFAx6Nfzvf1eIcmbOTXqPwE=;
        b=YXjvD5t3MeSueB8hAcahzZsE3pkeRg+/d8Z4uGa9qDisSUybJtLcjkq651SU/HnFs4
         3xUNyNeSyq1yOWWkjqn/F7/3EHgd2r/ntzcU4X1JcSOj99Y8HotSLo4Pq2DllheJfMou
         R+IIxMUD5Ol3gO1t4JysxtW46E+l+DcsPyNJABjmd4WcmxhKciDmpynlp1P2tJMpe5Qa
         dtumKl4herhcdw+1u07uNEX5h/EmJfei5cMMNDffotjGdN8f5VDf6U1RcSOau0UK0LKA
         1iFINp80RJtlV8yUkm/darXF6yC+FoNZDaXYtHHgFEwtZfhYnjW0yyjHhrT+YQJgJDZX
         nxWg==
X-Gm-Message-State: AOJu0YxHe56WESvzwdMLoK/mNleSFNc+T4ov8QRzC71sjivHSKBu+KL8
	dpCY4gJ2zIkJ1nHz16dHeXE=
X-Google-Smtp-Source: AGHT+IELClSbAQz1V/0drxjg1UD4ziQ+8CYyLr/3Fhum171i0Mlj3ge6042agi3t4nhAvWOeigTzjQ==
X-Received: by 2002:a05:6a20:4304:b0:16e:26fd:7c02 with SMTP id h4-20020a056a20430400b0016e26fd7c02mr1709920pzk.2.1699440659349;
        Wed, 08 Nov 2023 02:50:59 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id fn3-20020a056a002fc300b0068fe9c7b199sm8728468pfb.105.2023.11.08.02.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:50:58 -0800 (PST)
Message-ID: <35c77f16-d01f-4dfd-96a7-2f6210e40e94@gmail.com>
Date: Wed, 8 Nov 2023 16:20:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs : Fix warning using plain integer as NULL
Content-Language: en-US
To: viro@zeniv.linux.org.uk, brauner@kernel.org, dan.j.williams@intel.com,
 willy@infradead.org, jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231108101518.e4nriftavrhw45xk@quack3>
 <20231108104730.1007713-1-singhabhinav9051571833@gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231108104730.1007713-1-singhabhinav9051571833@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/23 16:17, Abhinav Singh wrote:
> Sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to initialize  pointer to NULL using
> integer value 0.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> ---
>   fs/dax.c       | 2 +-
>   fs/direct-io.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 3380b43cb6bb..423fc1607dfa 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1128,7 +1128,7 @@ static int dax_iomap_copy_around(loff_t pos, uint64_t length, size_t align_size,
>   	/* zero the edges if srcmap is a HOLE or IOMAP_UNWRITTEN */
>   	bool zero_edge = srcmap->flags & IOMAP_F_SHARED ||
>   			 srcmap->type == IOMAP_UNWRITTEN;
> -	void *saddr = 0;
> +	void *saddr = NULL;
>   	int ret = 0;
>   
>   	if (!zero_edge) {
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 20533266ade6..60456263a338 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -1114,7 +1114,7 @@ ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
>   	loff_t offset = iocb->ki_pos;
>   	const loff_t end = offset + count;
>   	struct dio *dio;
> -	struct dio_submit sdio = { 0, };
> +	struct dio_submit sdio = { NULL, };
>   	struct buffer_head map_bh = { 0, };
>   	struct blk_plug plug;
>   	unsigned long align = offset | iov_iter_alignment(iter);
Thanks a lot  maintainers for looking into this patch and accepting this 
patch.

BR
Abhinav
