Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22120C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 19:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B172F401C7;
	Mon, 30 Oct 2023 19:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B172F401C7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HFTwhS+c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNqSaP403Pte; Mon, 30 Oct 2023 19:39:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8D80A40183;
	Mon, 30 Oct 2023 19:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D80A40183
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BE70C0071;
	Mon, 30 Oct 2023 19:39:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21401C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0C1440446
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 19:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C1440446
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HFTwhS+c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktHJnLVi_9R3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 19:39:51 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E07B240018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 19:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07B240018
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d9beb863816so4303601276.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698694790; x=1699299590;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BsBULrXurlnUUPobuOc2JUUL821FidVFYB/7ZUCqbqQ=;
 b=HFTwhS+c+OjAfFtQuXyiEj52LhvQ+00Hk42M2ynX1dZ9oBy1mX9HALyAd9ATPDd85k
 RXZrgXYaZpSdPxjqs5apkDgUuxuEo3I2CtAhjlXdVq3ITC+I6ko5LAIN/he/d+LjKag/
 KJzc+FH8scHrc74f8YZml47o5hug+BBLVw+fLgSOYKrSdwV7cMfUgpK8ZA+0fi/XZLuu
 tTC+7V8UC0asKAP7X5jkVWimY4LDi7WUZjJIsOll2nOjSgDHRW62YgHkCQp05Cb6Uk67
 E77CN8eni8bMWH/K3lr4l0Uu0WPe5wFXDSJNcEWDjXTgYZnDZrGnnI9a37q/G/pFLUY3
 g2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698694790; x=1699299590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BsBULrXurlnUUPobuOc2JUUL821FidVFYB/7ZUCqbqQ=;
 b=g+cpVY47K4wCYkfu92YxfO0/sGE6BfaUoORdHi0l4VOMBexd7Bzi+PvQidOWMz2Gca
 KQ+N6FzLDxT6rhLL2BVRw+uMny6btse35+rcVv9yS+w/Dd7O93Y8wPX1qbwUR+8P2b/8
 xHEf/nR7vEJSJ+M4jx7pOa+f76d0seIEQNYLJ1kLVma1tz3Z0z3K64FkCZedqhWsg1Ox
 Kc4savjT20orsUPXgpF9ScMbSb1yqKvgfRne9RtHQ7ovcGlhBsnGzPlrSGO173MtB2ot
 V0+yG6APEawEbTsJziBb5oSj56IkiKpy9FqUyAGvQCqHTesSRUdVTqkRFsABi+gqQlMU
 zECg==
X-Gm-Message-State: AOJu0YycKGayoLAyZnHONfVp9cQgRZHlXSnWayXGYwz1b63R0Fx+eUTR
 HXwJ+VDRhyDNEIbKh74BKHY=
X-Google-Smtp-Source: AGHT+IHn+RPSeNCAzAD8bj9UAzLPTZbj8frSIeBf08GihOIWy7m2i+qPYQdsJCMar4vwnVBfSg/OtQ==
X-Received: by 2002:a5b:c2:0:b0:d9a:da03:2417 with SMTP id
 d2-20020a5b00c2000000b00d9ada032417mr9478650ybp.45.1698694789691; 
 Mon, 30 Oct 2023 12:39:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:6cf8:1240:5b04:e8d1:ce5:8164?
 ([2600:1700:6cf8:1240:5b04:e8d1:ce5:8164])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056902024b00b00d7b9fab78bfsm62003ybs.7.2023.10.30.12.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 12:39:49 -0700 (PDT)
Message-ID: <767f32a8-d00b-4bb9-bbea-f972caced064@gmail.com>
Date: Mon, 30 Oct 2023 12:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add malloc failure checks
 in bpf_iter
Content-Language: en-US
To: Yuran Pereira <yuran.pereira@hotmail.com>, bpf@vger.kernel.org,
 yonghong.song@linux.dev
References: <cover.1698461732.git.yuran.pereira@hotmail.com>
 <DB3PR10MB6835F0ECA792265FA41FC39BE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Kui-Feng Lee <sinquersw@gmail.com>
In-Reply-To: <DB3PR10MB6835F0ECA792265FA41FC39BE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Cc: haoluo@google.com, brauner@kernel.org, iii@linux.ibm.com,
 daniel@iogearbox.net, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
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

Acked-by: Kui-Feng Lee <thinker.li@gmail.com>

On 10/27/23 22:24, Yuran Pereira wrote:
> Since some malloc calls in bpf_iter may at times fail,
> this patch adds the appropriate fail checks, and ensures that
> any previously allocated resource is appropriately destroyed
> before returning the function.
> 
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   tools/testing/selftests/bpf/prog_tests/bpf_iter.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
> index 123a3502b8f0..1e02d1ba1c18 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
> @@ -698,7 +698,7 @@ static void test_overflow(bool test_e2big_overflow, bool ret1)
>   		goto free_link;
>   
>   	buf = malloc(expected_read_len);
> -	if (!buf)
> +	if (!ASSERT_OK_PTR(buf, "malloc"))
>   		goto close_iter;
>   
>   	/* do read */
> @@ -868,6 +868,8 @@ static void test_bpf_percpu_hash_map(void)
>   
>   	skel->rodata->num_cpus = bpf_num_possible_cpus();
>   	val = malloc(8 * bpf_num_possible_cpus());
> +	if (!ASSERT_OK_PTR(val, "malloc"))
> +		goto out;
>   
>   	err = bpf_iter_bpf_percpu_hash_map__load(skel);
>   	if (!ASSERT_OK_PTR(skel, "bpf_iter_bpf_percpu_hash_map__load"))
> @@ -1044,6 +1046,8 @@ static void test_bpf_percpu_array_map(void)
>   
>   	skel->rodata->num_cpus = bpf_num_possible_cpus();
>   	val = malloc(8 * bpf_num_possible_cpus());
> +	if (!ASSERT_OK_PTR(val, "malloc"))
> +		goto out;
>   
>   	err = bpf_iter_bpf_percpu_array_map__load(skel);
>   	if (!ASSERT_OK_PTR(skel, "bpf_iter_bpf_percpu_array_map__load"))
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
