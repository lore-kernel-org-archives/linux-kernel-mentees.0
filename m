Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EB33F8D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040296; cv=none; b=taqBYq1lKHtpY+/9LkBepi3ufNfBozFgULb/bZ216LGYL4mPh3pOMOr27sNj1EkDuJBbSgEmZJ0GdsLihmmIY5Lf79N/kZNgJODn7NsUHVuTQ/zKFHHAq+knUx+5xhDIbV9sTsT23MNwWzQy3F8UM/trgwA4SQUmFktoVd+sSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040296; c=relaxed/simple;
	bh=/G842q39ITL2+dv0er/oi50XuXabVeCFAWGwYX/iW3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIj/o6/P4DFPArfgkpN8PH132ok3vCZVxdAbBerbQdn9o9fzPgUYigP7v45MiK5bWw4adcg3UR9L3n8EEpyYGCNkIgRWJGJ2r+hZ/ULCnF0v6CEh64LE/nVLwIs5o4Z0fKa2fiBRKcpXbsYRsnmtSdGaoVeWgR9RSeeOOkCQepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bx7PhIs1; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bx7PhIs1"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1798808AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Nc6IIA3UMpI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 13:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEC2B80898
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC2B80898
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bx7PhIs1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CEC2B80898
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:24:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-471d83da4d1so277275e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763040292; x=1763645092; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7jIez1MXpJkQUncD4sP1e3Goi5dMHittA/PGNqTbAk=;
        b=Bx7PhIs1iKOjZNjbflGslbnPWzlDYd3IdDG2+ACTLhBPMcl5ZAstIe/TvKnJWRfBtr
         6ac845Hupj1k3UG2zGPxi7aiMmTRloAlQ9Lzcv1v1ZNOLCjLXJpi4K9OX5gVl12vUR26
         cE/iGaJG5hwK9K/dWrcyJcgPy81GFBInlmRQUF6LhB0poYrwcpS8eJs0rC29UCGjA0Sw
         dnRooMUMyvaxrFoCi20sOhiBLXXj6za/gq7pCSM3uiyZHOcxp9rcw+/TtsC2ynne50CS
         bi3Sx+EQEVgPX8wpznWGE3lCpkj/4ZrxiMF5tWJCduv/QX+jq0cridcTf0rdF6VqAil5
         zh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040292; x=1763645092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7jIez1MXpJkQUncD4sP1e3Goi5dMHittA/PGNqTbAk=;
        b=AmUAfAn+Qi2MfdAHj7H9U3VhYfnX6kGre50vXNMVKqizS9WjJ1KcL8gXGyQMavdgsD
         pCEolDM7nN5HJ0HhMRdQxwQkU5QmitBOKBhAdDLDn8RQq6G9Nf6ojlvmBQLdXuSYgGAQ
         93F6zAZU//vT5mqHly1eRZD0C+895zBmSPxvT40xqH7hfD+pHkAt6jz440rsdg/6ewnS
         FdQ/0u5wxyo7PBZ3Ok+RkdbRawcWgR/d+r0sR75ZFnKpKfuaLK4oDebVuuDGgBHowKGM
         w2SeGYQWOxbOW7MDfI8Y3sffb4rQ8ieo07Pa7ydtnqKGPQWuqtvemWkYmgih0oXU0RHE
         Y01g==
X-Forwarded-Encrypted: i=1; AJvYcCUCffYxmYL0rVoOaBRGj7Sfx0fdwnEMmPjNHWblnEOHm8jnjoQstbENenMscGsDEz/wdKsBBR5qfnFR2EPWzKOXrsF31w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzE5+70Vm0/Fv8z6SLPYo5YD6xxaaOoBHHGNjuLMSyKqjShqgad
	e1bCgZ7scWN/+TtW8qT650SOxmPvSAoDviKf6BsDmYdSw3WQubRMxt3c
X-Gm-Gg: ASbGnctRJWNyEM6L455m+nRc5yzf10T8aPFX6XQGPRJ5Rt6AwE2EeoMuLDtHVAJIMMY
	VHhFMewbKMy8++1SAFA014lV6SlwkIMFyzcsBRcruYihFXBr7N7wDzi+Ezox2LRsF+PlPKgr47O
	TsbTboVePTORNLIq3xI4S3kbLZ9YFQTu5DOIuwNR8m276hBfrL1rCyJA1WwPDbL2IdbM02Fk+Yc
	0VcMxUh6995G9YfKe5lWba7Hj/iQ1h9jvkgWu9dywonDDCjEB1julqO3RdtQ1yap9idsSJPMapQ
	UTLyvjwsOGOADNY3XSOjffTOBk7q8gXrmRnBb/qVDVqDMwcx1FY2DaWQ7Q9hetejZDRP8NXVJ3a
	0v96ZdzBcKe8rS6Nf5hG0qwnaffIJpD92Ow5UpNdXHlmcAq8ElGJ7jhWNd0BGW8+UW+XdS8wDko
	auU5RwosWU58pxzPJMDzi1vQ==
X-Google-Smtp-Source: AGHT+IEoYTRrkk4/MsqCg1hhWamxmkk6fIEwfucpjkEgmd6ISTBSqIjpMm6wzZyTSudgBXaqmBB8Xg==
X-Received: by 2002:a05:600c:3b0a:b0:477:555b:3411 with SMTP id 5b1f17b1804b1-477870482f7mr32516245e9.1.1763040291609;
        Thu, 13 Nov 2025 05:24:51 -0800 (PST)
Received: from [192.168.1.105] ([196.239.132.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787ea3b56sm88868715e9.16.2025.11.13.05.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:24:51 -0800 (PST)
Message-ID: <2f26b1a4-4dfc-4a8f-bebe-5be77107e4f4@gmail.com>
Date: Thu, 13 Nov 2025 15:24:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm/uffd: remove static address usage in
 shmem_allocate_area()
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, peterx@redhat.com, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251111205739.420009-1-mehdi.benhadjkhelifa@gmail.com>
 <aRXDbk9ajOhH7ReX@kernel.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <aRXDbk9ajOhH7ReX@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 12:39 PM, Mike Rapoport wrote:
> On Tue, Nov 11, 2025 at 09:54:27PM +0100, Mehdi Ben Hadj Khelifa wrote:
>> The current shmem_allocate_area() implementation uses a hardcoded virtual
>> base address(BASE_PMD_ADDR) as a hint for mmap() when creating shmem-backed
>> test areas. This approach is fragile and may fail on systems with ASLR or
>> different virtual memory layouts, where the chosen address is unavailable.
>>
>> Replace the static base address with a dynamically reserved address range
>> obtained via mmap(NULL, ..., PROT_NONE). The memfd-backed areas and their
>> alias are then mapped into that reserved region using MAP_FIXED, preserving
>> the original layout and aliasing semantics while avoiding collisions with
>> unrelated mappings.
>>
>> This change improves robustness and portability of the test suite without
>> altering its behavior or coverage.
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> Testing:
>> A diff between running the mm selftests on 6.18-rc5 from before and after
>> the change show no regression on x86_64 architecture with 32GB DDR5 RAM.
>>   tools/testing/selftests/mm/uffd-common.c | 25 +++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
>> index 994fe8c03923..492b21c960bb 100644
>> --- a/tools/testing/selftests/mm/uffd-common.c
>> +++ b/tools/testing/selftests/mm/uffd-common.c
>> @@ -6,11 +6,11 @@
>>    */
>>   
>>   #include "uffd-common.h"
>> +#include "asm-generic/mman-common.h"
> 
> Please drop this.
> There's already include <sys/mman.h> via uffd-common.h/vm_util.h.
> 
>>   
>>   uffd_test_ops_t *uffd_test_ops;
>>   uffd_test_case_ops_t *uffd_test_case_ops;
>>   
>> -#define BASE_PMD_ADDR ((void *)(1UL << 30))
>>   
>>   /* pthread_mutex_t starts at page offset 0 */
>>   pthread_mutex_t *area_mutex(char *area, unsigned long nr, uffd_global_test_opts_t *gopts)
>> @@ -142,30 +142,37 @@ static int shmem_allocate_area(uffd_global_test_opts_t *gopts, void **alloc_area
>>   	unsigned long offset = is_src ? 0 : bytes;
>>   	char *p = NULL, *p_alias = NULL;
>>   	int mem_fd = uffd_mem_fd_create(bytes * 2, false);
>> +	size_t region_size = bytes * 2 + hpage_size;
>>   
>> -	/* TODO: clean this up.  Use a static addr is ugly */
>> -	p = BASE_PMD_ADDR;
>> -	if (!is_src)
>> -		/* src map + alias + interleaved hpages */
>> -		p += 2 * (bytes + hpage_size);
>> +	void *reserve = mmap(NULL, region_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS,
>> +			-1, 0);
>> +	if (reserve == MAP_FAILED) {
>> +		close(mem_fd);
>> +		return -errno;
>> +	}
>> +
>> +	p = (char *)reserve;
> 
> No need for casting here.
> 
>>   	p_alias = p;
>>   	p_alias += bytes;
>>   	p_alias += hpage_size;  /* Prevent src/dst VMA merge */
>>   
>> -	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
>> +	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
>>   			   mem_fd, offset);
>>   	if (*alloc_area == MAP_FAILED) {
>> +		munmap(reserve, region_size);
> 
> I think it'll be more readable to put munmap() after setting *alloc_area to
> NULL.
> 
>>   		*alloc_area = NULL;
>> +		close(mem_fd);
>>   		return -errno;
>>   	}
>>   	if (*alloc_area != p)
>>   		err("mmap of memfd failed at %p", p);
>>   
>> -	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
>> +	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
>>   			  mem_fd, offset);
>>   	if (area_alias == MAP_FAILED) {
>> -		munmap(*alloc_area, bytes);
>> +		munmap(reserve, region_size);
> 
> Here as well.
> 
>>   		*alloc_area = NULL;
>> +		close(mem_fd);
>>   		return -errno;
>>   	}
>>   	if (area_alias != p_alias)
Thank you for your suggestions, A v2 has already been sent out with your 
suggestions.
Best Regards,
Mehdi Ben Hadj Khelifa>> --
>> 2.51.2
>>
> 

