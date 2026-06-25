Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D100383328;
	Thu, 25 Jun 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378669; cv=none; b=saqye10gfOPh1OL5OofAI0P8EfmJNo7mTEkhBrOE2uf4c+Rk2ctgdxWZqa2SUgVFDq0948MGF2MG7rMaRyj2UYEu6U8iz6QIBWlupoz9cPpBhAZ+8vey83nv5UMze1djJcdTKYT1rDeCNVx6qb0JRRlopME3PW9FtgtVDBHRAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378669; c=relaxed/simple;
	bh=vYVLm2mowQLSLaH1djH7NkJgaINe3c0SQXcyEO1fmBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8viK1ThZnPJzm5pwmoR/jLhUwoMZx4amBXdHmO7pIGESEFA6PNSZ8mn0fHVu+2VWEKNNQsC/RAK5gPDCRmJy3ehklSRLa0ZvMznCXtRXOIzqbTJJai2qwIKxFXL84NSQUUNQND0cTc5rE2J/jOD16Z1hzZAt3YlCebKeftBqAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0rd3Hq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0rd3Hq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79A11F000E9;
	Thu, 25 Jun 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782378668;
	bh=w/sutQTxrkpg6/YMIZU8opSDaoNh05pdMby8e5mXodQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n0rd3Hq8UXydvt8y0GFa1ngVOYAY3si0zXLn/WcE1kmSJidgdkN4Ztp+BDfqBHGus
	 iGbF/STWqCa8w6YsvBW740mJtwdt4fLL3dMxRvt17IHur3M0Xxpt9DuLx3eFEprzGW
	 ZcJ1mftxKRknK5TkTmjiR4rVC1S+JhbzEuQfc46XQtZ8pryFdQMt3t9EaNW71Uxw0b
	 WjNiF/ntKLtDjXbNakPN+1bqkG2k/Y9T+TdFLMtaCMsIzVqAOxh/4hA71BQjErW+Di
	 64THDw8NvDG72UgOu9GVIU6kfwKebCaZT0yPxgdkZfVhwyKIEAFQm//3XjmHN+4OPE
	 qoKR5Ymnu+4kg==
Message-ID: <fdcf9684-56cc-4389-a845-c53386171974@kernel.org>
Date: Thu, 25 Jun 2026 11:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/mm: fix documentation warning for GFP parameter in
 kmalloc_obj, kmalloc_objs and kmalloc_flex
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Jakov Novak <jakovnovak30@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20260619113622.11712-1-jakovnovak30@gmail.com>
 <20260624184856.55fe055b85e17ed2c6572182@linux-foundation.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260624184856.55fe055b85e17ed2c6572182@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/26 03:48, Andrew Morton wrote:
> On Fri, 19 Jun 2026 13:36:22 +0200 Jakov Novak <jakovnovak30@gmail.com> wrote:
> 
>> Subject: [PATCH] Docs/mm: fix documentation warning for GFP parameter in kmalloc_obj, kmalloc_objs and kmalloc_flex
> 
> Thanks.
> 
> "mm/slab: ..." would be a better subject.
> 
>> Date: Fri, 19 Jun 2026 13:36:22 +0200
>> X-Mailer: git-send-email 2.54.0
>> 
>> Compiling the documentation currently gives the errors:
>> 
>> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
>> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
>> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'
>> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
>> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
>> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'
>> 
>> This effectively omits the GFP parameter from the current kernel
>> documentation. This patch marks the "..." parameter with the previous
>> description of the GFP parameter along with an "optional" tag in
>> parantheses.
> 
> "parentheses".
> 
> I'll assume that Vlastimil will be processing this patch.

As Harry pointed out, Randy already fixed this, since then it's in mainline.
