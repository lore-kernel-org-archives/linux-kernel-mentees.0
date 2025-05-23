Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B75158535
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748035994; cv=none; b=L+ZSI8K7vFspHV4GKyvvgHwF5ZpfNZ5AbmOSWKH9HfSctWptL6x2dr/bjlU2qs2L4UyYSBBBmRoH15HNVXQhmuvNecKqOQklz64p1kafw9T2bk0fJL1vfykhquwXqdeQ9YfccjLjF+Yue5Ss+2dWAIRIaGPw1GwAXklxXQNOlYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748035994; c=relaxed/simple;
	bh=t6LBh1erf6q85Lrcs1o3C3ibSfhlLfMbc8dn3fx1GKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW6cFL3l1a6HrWbuPIQX2wUx1Jr29Ix2++1nIBEG8LPdMrknezIRRkQvhI+g1isXIPKZCjJ+IlA8Nx3PChKdYnInF5chWMsWUo+sz6uprEx+HusqIkw/7rKBcxy6UOaUf6fFoN1dh/B+hn6bhj/igs8HsH4vO+YAWT1QYujbVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egvXgyED; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egvXgyED"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso225287f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748035991; x=1748640791; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpf4Pbv2LaunBeAGYa0hZONpjIJoOeyE288WoeCcc9A=;
        b=egvXgyEDw5K2sJlOTAUlppZpNEupU7mawBPbidSA6DASaf6nIrnFwWVcGH3Cv1qkfg
         rpgBDbTAuoMBuWQ6YcNzrY1et1E0W51ih3+sbOWaualxgUYaSTFXMbnlZTCriZp7m8kj
         sdCFEY4Yi2EXYaprTsNs8AMRStcWeMD9YWlC5CxY3hhK8Af5ljbGpHxZk8IrHmlI0ZFO
         f8W5uquOfGX6cE7KN+Xc7cYKh9EFKrP2czV1oXJniXQiuc67gKzEoA/DzhPq9S3amIfE
         sKLtmcxoU7JiIMM10z/5kCxm7ngWeIDecc+M0x8fwQbOEs7xwmoVMOt08hTE13p8n/9r
         EjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748035991; x=1748640791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpf4Pbv2LaunBeAGYa0hZONpjIJoOeyE288WoeCcc9A=;
        b=f+DG1guE+qcYXG3mEMw+s3lcQWQ6koj1ZdUMtcLNgYZQFWYzDfnXikX/KypS2mLcWY
         3SKBH/rf3hGsCrPox3Hb51vrJ2IXiEMglozrJtOQ6VbcTXSJwL1ZI+znpz8SPP1EyyGe
         FFgSrM6F3ZcSbzbB0L4kK+tc35Z1yD455qk7wmbNdnpJZFdyXpzMANPX+nPwff1HDZIS
         BO0LXJhUCmsV8yo6nAJ3282eoDTn9cEPrixQej4WWzrKtt3PqinQseKX14BywOwJwl7W
         4Suvh3x3noTMFEhgABKUojZlsliIfMwQyjhsjdkjsiTkbDGpK4lRCTjN60eAnTAtGbcH
         5eeQ==
X-Gm-Message-State: AOJu0Yy7pkwE0IPlmoScC5SBarIwknrPY47dahObSmYeIxq4x2TrKyQ0
	/UwxKGcJzeldibcWrqqnj30oV7G4fkQwNnm0OsCuwXIeWwA+pY93iA7675rz/A==
X-Gm-Gg: ASbGnctMvagm9pR7hqbm4fzv854SUFTRUNkQ1l+8Jd+21hLF/pGZYQA71wKPbKeFMG8
	8c0XsNjuQ2UGX62T6UcXbNnY2jfTMneTm5+vuJWVFacuo961R79wre1Y39xqoayHBz14uQ0sXIg
	uma9wwn7Hu352jsMX98mBmVA46QUwkt15xTvtBrhLhXDf8IitE1Su8KrcK5tnnvvHfeDMAui/p/
	i9EhSixiR3uNmmIsiPo5yS21RZniSfKRy7LKozJ0xzj9dOimH5NVu09dmzjdy1qzungFuK4GEnm
	3FRX14qagTeIjPVguUaKBHww23zV2ljTA1rVBOPunY0cKg2HSM16rvfk9vk0+RdF2s5D
X-Google-Smtp-Source: AGHT+IE3WHr7NkotDT0Tn5O4UHcUPRin9SJD8uSEXI0fanie/Wcubh2smOWrZEWwxNVVsR9JC6NhtQ==
X-Received: by 2002:a05:6000:2285:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a4cb408fb0mr677310f8f.7.1748035990451;
        Fri, 23 May 2025 14:33:10 -0700 (PDT)
Received: from [192.168.1.46] ([154.183.50.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c8cdc618sm1247221f8f.0.2025.05.23.14.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 14:33:10 -0700 (PDT)
Message-ID: <73101285-2854-470e-a3bb-9a363a7c1991@gmail.com>
Date: Sat, 24 May 2025 00:33:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] selftests/mm: Skip tests dependent on a binary not built
To: Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org
Cc: linux-kernel-mentees@lists.linux.dev, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
 <41d3b11b-d269-4ee5-a118-6608c804e068@linuxfoundation.org>
Content-Language: en-US
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
In-Reply-To: <41d3b11b-d269-4ee5-a118-6608c804e068@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2025 12:09 am, Shuah Khan wrote:
> On 5/23/25 12:43, Khaled Elnaggar wrote:
>> Hello.
>>
> 
> The above doesn't belong in change log. Refer to a few change logs
> in the repo to learn  how to write them.
> 
> You can also check the kernel documentation - this change log
> is way too long. It doesn't clearly state what is being fixed.
> 
> In this case, "write_to_hugetlbfs" is missing because the right
> config isn't enabled. Test stalls waiting for write_to_hugetlbfs
> to run.
> 
> You are fixing this by checking if write_to_hugetlbfs exixts
> from /mm/run_vmtests.sh
> 
> Summarize this in short description so people can understand
> the change.
> 
> thanks,
> -- Shuah

Oh, I mistakenly thought since RFC does not get merged into source tree, 
it could have a relaxed tone, hence the much text.

Appreciate your feedback, I will rewrite the patch considering the
points mentioned. Thank you.

