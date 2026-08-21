Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411E427A1F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323744; cv=none; b=V1M07JzcAz/Y2k/ibrBoby+209hglCyUNWCGaYUizqV3ytV+ku29K8l+Swtf4FDmZwh7u456HrPbZX1Ptl4Q/K7eKW7+ocVGEPXObsqqj+GiVZTeZ76oLcX3dNXLKOQbdUECMPs1w0Q79Ty0/ltftCmGs/eNSL9pWbERSfX64MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323744; c=relaxed/simple;
	bh=INT1Vtti3BreOEpeqwcIP3LbJxbbfHxuT+kCBc19nBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ei2NBuzUqAvrqgOp3P/I/aYAqsDSFGnkMi2U2d6bVT6SSbQVDsZgxx9mfxtxP6sID+n5Neb8Jn+DTIa/rsvSGXzSWA89rb2RBsRGEpJ4PB2FaSJtldtMGSDyD0tuqSC1z62P/4h8jmzdw2hw2/LaM7gEQyc2v+7FzEVlLuFHOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T796/c4u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T796/c4u"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso7447495e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323741; x=1787928541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RySDzNgFwOZt+mpqx8aHwP46Unuo6yoVJSd8AB2W69Q=;
        b=T796/c4uyQNgo2E3BA/xtT26Bnq0K01ehoN7jguF6T8Wu5FY7Qf5G/lnW2lSbEI4Me
         Q63zCVysqL1myjxMWD1yK2S0vtDo37lg4V261QULkaRaaX+LnE+Dh8omMRGVtbQXrbAX
         UBjP4ODua9/7td8VkvxJEdRJifA+ii6TvdtMnwV8LrP86yMZ1kFNsFqtPZNqpCI8trhy
         YnACavqbEC9TkWmNyc8ZN2JpZ8PXRBiMxjMYP0KOtb9Q8pCdOw9APIBFyl7CpZkvYa3M
         nav2jnq8VIfodCSS49XM4LnhB89ilOt9WnvPlBhhWcszS6zTcLDan/eT9TjfiSuwooND
         JF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323741; x=1787928541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RySDzNgFwOZt+mpqx8aHwP46Unuo6yoVJSd8AB2W69Q=;
        b=ho1InyjcTpr1y0nVNBwCmt0/4gnOvOTULYQcqat7GhezEO15rK2PfKujd8LO50aHlC
         FwIDMyGiLObAPgau2V6XXrSJKS6sUL7Rn3B8gZNY1LLHFcKh+6daWfBw/ABJ9vlxsTjr
         HiGtNAjxrG9H4rIjsVFJ+J4fefmgqS2UTXpxXhTLUqsF007NiNcrZ3J76Xa9IeynNjcM
         +tFwqtm6ClhGQfyJ+iOvItU9NkskYL2x8+CsO9s73w4JH25hBjEp4v73+bOS1G84pyTy
         e83S14ARgGNKWtmNJxRmcZpymoM1Q8ysORtTEYpXTxktUXpqfUnkmm/W+/lV/IACxBgW
         HLmw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1eLvXwk7eJfeKA2JhWpO/z2GeRcSwAj5QP9IyZMLJuE20HwtzkTD/vKLxuOxnKAzYlvOIiRpshue/LZqFVlbU/6FsDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCRnGN65ReYajNu0ZqFYL2kzoYOT1BjpJ/Tv3uNdBd6HgBPT4u
	BJkZ0JxCU0KgF14j1/oaIeho20feKkWvodKB8zPSEIqNxD/3tNuwv5OG
X-Gm-Gg: AR+sD10V2XRbSe8YPyfMejbW/wdn3qW7PiP+M5vRuyLB6ydmplj+Z/80wD/mEB4RpAs
	qsTntKNtd9Z44RORZmK5CsXeb6ZliuQzJvMDDq0YUPTrPn+yXi/FKwlTZrnhBo+Hw5xT8HZz6ZP
	gXN+N1nqFT48UN7b2qcNwize0v74VFqvZ/yspOUvqGbz/JVRGoeaJChOuNGi0XLBWlawm1aw2g5
	vI6QgKy5XsMDWKYq6e48WGScp+3BiCKJL8tQMEkzmOmi92pJ2g6Gc5Qh3foOEycLAnKA8to/KRY
	XESQ9RI4Nv9lF8L4l8NplUqJl0++Hx4XS0lo/iVdKpIGcmDx+LXDevpPYeHnKZj9IZhqdWExZrl
	Q5R+G/CUtaOq61nfRT8sovu/AFAue05ePGLRT7CStzZR3fWuyYwtI7T4o03nK+zhR7TblOZSTyp
	BwIteB/EeRxWs56y4k8P0ASJsSj6LocLD2teN1iKXq8JkdKBgV1pwBNHriaRehkURlqmu5CHClI
	ESHM1TDm34afNZSAPKu7/FZ+A==
X-Received: by 2002:a05:600c:4f87:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499b830d220mr94399405e9.3.1787323740952;
        Fri, 21 Aug 2026 07:49:00 -0700 (PDT)
Received: from [192.168.1.10] (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499be3a3e2esm10640175e9.1.2026.08.21.07.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:49:00 -0700 (PDT)
Message-ID: <3b85e6e2-29d0-43ea-abe2-246f1148939a@gmail.com>
Date: Fri, 21 Aug 2026 16:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Memory leak error in qxl unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 stable@vger.kernel.org
References: <20260809165326.164763-1-megia.oscar@gmail.com>
 <2026080941-edge-lurk-2146@gregkh>
Content-Language: en-US, es-ES
From: =?UTF-8?Q?Oscar_Megia_L=C3=B3pez?= <megia.oscar@gmail.com>
In-Reply-To: <2026080941-edge-lurk-2146@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/9/26 20:19, Greg KH wrote:
> On Sun, Aug 09, 2026 at 06:53:14PM +0200, Óscar Megía López wrote:
>> I discovered an OOM after run the script below
>> (I updated it and added a sleep to allow enough time for the cache to
>> recover):
>>
>> while [ 1 -eq 1 ]; do\
>>    i=$((i+1)); echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/unbind;\
>>    if (($i%1000==0)); then\
>>      echo i=$i; free;\
>>      grep nr_free_pages /proc/vmstat;\
>>      grep -E "PageTables|VmallocUsed|Slab|Reclaimable" /proc/meminfo;\
>>      sync; echo 3 > /proc/sys/vm/drop_caches;\
>>      echo 1 > /proc/sys/vm/compact_memory;\
>>      sleep 10s;\
>>      free;\
>>      grep nr_free_pages /proc/vmstat;\
>>      grep -E "PageTables|VmallocUsed|Slab|Reclaimable" /proc/meminfo;\
>>      uptime;\
>>    fi;\
>>    echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/bind;\
>>   done
>>
>> The OOM isn't just a simple leak; it's a refcount corruption which renders
>> the list_lru fix dead code after the first mid-init failure.
>>
>> Here's the chain:
>>
>> Bug 1: ttm_pool_type_init() does not check return from list_lru_init().
>>
>> Fix: Check the return value from list_lru_init() and propagate the error.
>>
>> Bug 2: ttm_pool_fini() does not destroy list lru with list_lru_destroy().
>>
>> Fix: Add list_lru_destroy() after ttm_pool_type_fini().
>>
>> Bug 3: ttm_pool_mgr_init() does not check ttm_pool_type_init() return
>> and does not free pool if returns error.
>>
>> Fix: Move up shrinker_alloc(), check ttm_pool_type_init() return and free
>> pool types and shrinker if non-zero and return error.
>>
>> Bug 4: ttm_pool_mgr_fini() does not destroy the list_lru.
>>
>> Fix: Add list_lru_destroy() after ttm_pool_type_fini().
>>
>> Fixed check for an empty shrinker_list.
> Why is this not 4 different patches as part of a series?
>
>> This patch depends on patch ("[PATCH v3] drm/qxl: fix use-after-free in
>> qxl_irq_handler on PCI"), link [1] below.
> That's not going to age well in a changelog text :(
I'm a newbie. What's the best way to add a patch it depends on?
>
> thanks,
>
> greg k-h
