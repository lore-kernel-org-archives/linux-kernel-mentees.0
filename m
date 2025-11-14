Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B4C2FAC14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763153757; cv=none; b=Bj1XLdaeq5xoWEbVB8+FtXMOHahWTgcRDWfulePSEv1OzXiecKkWf6BiAbwZHei13lMsE4U/FhNsbPbbVYtRjKsDvI4a16LFejqgmzl7g/esId8RApZUTt7/+N7Y4+ITvxVIIAMkFGb8CPLhl1dpuxFT+rMVgDcREEsCZqfEQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763153757; c=relaxed/simple;
	bh=NxQbVphzjH3kG5rqQGKeRhHbzlvSvof1OH7huy9mWiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5tMJ9QSL5g3H6hJIbyAoxbI12GSODjMDHFF8QJgzUgWsre7Lp7jPU2rGqzZhT9syhShxnQU7Gi7Ls7bFIsNxIy5wL+og/Nf6lsLpUyLF+QHAuckmh0JZY7Any05NQkMR9w/+GwQfC3PHc3nB+fqOlC3RBhmzc1J0D9DxK9FpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=FclQpJVj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="FclQpJVj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F4960899
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 20:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvKVNos2x7EU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Nov 2025 20:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.68.83; helo=sonic306-20.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B40A60618
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B40A60618
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FclQpJVj
Received: from sonic306-20.consmr.mail.gq1.yahoo.com (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3B40A60618
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763153754; bh=J5zkoAWk2fSUHFYj/nLWKfl8bydtBpoFLd5+sT3bO9k=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=FclQpJVjD5a+VTQEdX2S4sFDAu9BS/rnibg9vowMpKXKSO+ozvRNomR+a/+e5imVkOTl69CgziD7AC7P7FR8Xs59M/5/0XzzwMllJskXE28ggVVvIMao2nKHD4zQ7XPpLuXsLOc+KruWCzLdbYUV8rq0UowWSA499mfdCT+EvhFEo0eubEuApZBj0OufLDUA1TVFeaQMGh2ySw10dIGyo/namreCzeLDbY+21thFLy2BrZxO1L7bMkCRj1PCk526uLKSLdovzggoziwadmWOlr8VMQskBA3Z6jckwY7x5SOduEEICIQiHkLLBGo6kfD9wHatGnDBhpJ29nNcQQu2zg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763153754; bh=9/8InjyI4AxQ1MVGSzWAYK5WWXcCPCTTiMMfe/sgmEF=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=hpeg3T1IU8/IjY4DeEs4Eego5mZiq4ckmpejwHHWHwbiMRC7xVqhmf4tms/GQevl9KPZ/tjfS/YSkHJ7RjJj8H8tpUDI8Qsl/ljZ7ZBiO+c+O0AnT+8cx3PR53NyGenTj/NIhw2DrOuJD5SimoJtB7cP5dWfshcGzjjqWmf7tN/ibna4KJrjGK8WD3eomv3AoKq6vaFjlHABjmLD4InB3u2kqD7E3HvApkaUearrzednJMILbP7OJsQ5DdHhbxj6XGC19A3ZDIr+9kk873jJeXh9SucL9EbNLjNk8bGHb0btOiCLznMoaWKkXldngIJN0jF/7Uh+aJDGI/zSlo9tzQ==
X-YMail-OSG: dIpZZQ4VM1mjpQ8uKNS.8KYI0ogzaoS1z1VsDBKg0gtVijMZhcTBEcHefmkpgbx
 mHj2XtIxlcjGg0552_IX09ysABxzOqupMvDVgi78lztLbHiSnZXfPEKaxKTw5GliOYv8NQcEXxFq
 _PTfA48P9wHhA.FMxS5uQufs2N9HjwC1QkFf6q0VQvWUhxTu5ga4OEVOWCwyfWZMvm_Y6pxkwwuz
 LVzmZ2i_LtzhSHx1tCY.GwDfh3fITAqfk2JhVLet0W9iEoQl8gi_0DZOy3bTZpPIKdBofRafVAH5
 .5RKn2E2097eo09JA_Jv5775AYa4_BKzZktsIvOQx98pLr1nONc9WeVn5M.pynchNhXqmVN5Dwf_
 mOrKQ8DZsYdciXSK41RBSfDY4ATwxR0zboi28QIawesqucKs1hHKL6pX3ZC7GBQ3GPVCt_tGaxEe
 zpBzVjkJe2KsKb0kCQ4X6nOMAfwU82ffYATI4a3PcamxjgRbRvHaCd_hWqPoHcIX8Xm4gxodkzY.
 p7ZDGsw.YwHMRpqgvI5Bh6GKgSbpdse0xOdUJS4OUWefAy1cXIrffRURDeq34BGJOKdkn_bTM0B6
 z4mLjW5SPg.UDRgqtj6cAGuPv1Sr6fO1IhPv8MxQ5oG5pFQiwc9RSk8iJRM7C.y69e4DsAoLA4xC
 FJE1YmxNDwdiEaE689qmey1C6JXhnXPFaFvSCxvxeL3EuY0tuVeJw9NwHne9zmtHri0khhez51NB
 uA.Uvxzfyoo.6.d4_1QVpDZSOeiStPnOqSF0D1iYPPqCjhAZRNEw5KMNR8sM6xsPWe79lsWbrvHH
 Sl4RTIGu4.q_KlpdP7ESJy_tq8AznxujOyTKe.8eC4HFnXuH940IiJcjcMtzsgWkCVT1dH4LU579
 SGAhsC_ZcDNyiYL7Ntj1Zd9X37EGeTL1ZMnKfoRlg8YB5sWeizubnSU07MJcMXClkpr5kOI_A.xg
 Lf7CG_1W7Accv2wqBa6bXbYespy26mSXCV1Q01lo3fvgmQmvpAiuHZNXyBYfkeHAgSIONkEym7h2
 mViyG0.Tj0AZuxJqYd3vK5ZsPsFNrt7zHZzSe7vTUz5oAtsXQ0yTUhX7Tw83evHTGi9cWvPK2QY6
 knpvYsDRuNLjrRcTkJEw64_e5_iMzX8b7WxUXO4qX9AHTG2tDPVAfzAbfg_Qwj887lwE1sxPCJl_
 qNbUFV4HioJsA1xvVa4O6Ww43pMDcb2jTXkcD4uebWmBxNKCsKJb4ocCu_cbtXNNWDjnF7DrXNDt
 CgY4fWjzbfZ2QnwnGKrPvwizGRrA2fDuwIjNgTHElBwaZ1.D4dvNduS0ZwpVDwlVrkZIkFDHNcfl
 Lke3fBLDiugRZgekKCLWCxajiRaHOxqqSY_1aVqxAuK2G2Bggt338ftPOZn7WIwNWs0BQjo9uGk5
 XpdL2WbCWwS8rU5H5rpX.yP6tyMEHBPBfSGg6YhrMoSYoCJc9AroEN0skJzmfXYN6qLdz8ncA.k0
 Ham7pWeEGO5BgAMiqrK5yH0vMzyfhFRbX_gMlYsGO4.NCessBkzP.LwH7Cnu8h1wisOsIGabYvV9
 cIJ9ac_lVC5MIhpQYRV4WEoG7q8ot5P2SBbqzCMm33kKuJYWxN8KN3HegQSb5dJ2YhbH.P90n6un
 4LpGGTYUG0.RwiGMPX8oGarSXmtVK9EkcNydmVHqV1XtMT7RlfYWaXyBwYHtcydDXmUgPTQFwWEZ
 tRG4EmB4ZVxgsLlMhMv5dZLjjrc4ZEC_SiHYGvtEALv_jqEV079vZAS3svAzz3yDHJz.F9XHEsEd
 ZrP0UPV_ripb2Y9cHb2yPsIQFk1afACbIFZWF6x5RVMxUdO13pCwJVY90XquDJ35y3y7VIxJn8Mj
 8hl2NxWvjHDp8i3tg9fNaNRjOEg2ftWCoQN1_._NopsjndCOqy4jvNsFE26yk_w1KZDCzocNnc28
 4baFavorbEi05W0pF4jrIpbCawvmpzFQra1I8aW1t62VrL4aZ4W2LW0frx.P5HqwjZwhp5O9VpEW
 THzOHzCYGZdETyH3IQFdgIPK6SizlaronDreBMT9_pyaGwq5IP3dbFoRiMYdm.w_dzGMlXTK6LAz
 caDvRCVUVO0m0ViVw3ZKmfjXVVmzGohUy0vZQQKnVm80EWN6ZXVpHwSU.u4Z4IyUXMwycJ_RuYXS
 j_CxOEcX.Mqoqae5Zu_VB6jFAnawLXmLh1qX1uiC8ofr02Yu5EEv5XWaZjzPiaIOT8y8IgrtxNIp
 q9hVG5YwnjJ1FUfaytRb1DpZsw.JuPDkXePfPluNLS0z2IGuQGWvZU_b8r3w_RxLbnEclnf5.muH
 uSIXC.jcVzAH5WEKYM8nWvg--
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: ab96452b-2dad-4489-8923-e0027a5836e0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Nov 2025 20:55:54 +0000
Received: by hermes--production-bf1-58477f5468-88dvg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a3ae0dcf8900a3d607578bf8cf31e95d;
          Fri, 14 Nov 2025 20:55:52 +0000 (UTC)
Message-ID: <cbe274c1-c462-4fce-80af-828e98a91e7b@yahoo.com>
Date: Fri, 14 Nov 2025 21:54:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: swap: Convert kernel-doc comments to regular
 block comments
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: pavel@kernel.org, lenb@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20251113110914.44223-1-adelodunolaoluwa.ref@yahoo.com>
 <20251113110914.44223-1-adelodunolaoluwa@yahoo.com>
 <CAJZ5v0jEqNPPNE-5FuAm3Hd8YH1BecoOACoa6Sdr+VjHwBk9PA@mail.gmail.com>
Content-Language: en-US
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
In-Reply-To: <CAJZ5v0jEqNPPNE-5FuAm3Hd8YH1BecoOACoa6Sdr+VjHwBk9PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24652 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/14/25 17:37, Rafael J. Wysocki wrote:
> On Thu, Nov 13, 2025 at 12:31 PM Sunday Adelodun
> <adelodunolaoluwa@yahoo.com> wrote:
>> Several static functions in kernel/power/swap.c were using the kernel-doc
>> comment style (/** ... */) even though they are not exported or referenced
>> in generated documentation. This triggers documentation warnings and makes
>> the comments inconsistent with kernel style for local functions.
>>
>> Convert these comment blocks to regular C-style comments (/* ... */) and
>> update a few function headers to include proper "Return:" descriptions
>> where applicable.
>>
>> No functional changes.
>>
>> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
>> ---
>> changelog:
>>
>> changes from v1 to v2:
>> - Converted function comment blocks from /** */ to /* */ style for
>>    static functions
>> - Minor reformatting of comment indentation and spacing
>>
>> v1 patch link:
>> https://lore.kernel.org/all/20251106113938.34693-2-adelodunolaoluwa@yahoo.com/
>>
>>   kernel/power/swap.c | 54 ++++++++++++++++++++-------------------------
>>   1 file changed, 24 insertions(+), 30 deletions(-)
>>
>> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
>> index 0beff7eeaaba..076ed590e8c9 100644
>> --- a/kernel/power/swap.c
>> +++ b/kernel/power/swap.c
>> @@ -336,10 +336,8 @@ static int mark_swapfiles(struct swap_map_handle *handle, unsigned int flags)
>>    */
>>   unsigned int swsusp_header_flags;
>>
>> -/**
>> - *     swsusp_swap_check - check if the resume device is a swap device
>> - *     and get its index (if so)
>> - *
>> +/*
>> + *     check if the resume device is a swap device and get its index (if so).
>>    *     This is called before saving image
>>    */
> I'd move this comment (after the change above) into the function body
> (before the first statement) because the function does more than what
> is says.
>
>>   static int swsusp_swap_check(void)
>> @@ -362,11 +360,8 @@ static int swsusp_swap_check(void)
>>          return 0;
>>   }
>>
>> -/**
>> - *     write_page - Write one page to given swap location.
>> - *     @buf:           Address we're writing.
>> - *     @offset:        Offset of the swap page we're writing to.
>> - *     @hb:            bio completion batch
>> +/*
>> + *     Write one page to given swap location.
>>    */
> There is not much value in the comment after the change, please drop
> it altogether.
>
>>   static int write_page(void *buf, sector_t offset, struct hib_bio_batch *hb)
>> @@ -526,8 +521,8 @@ static int swap_writer_finish(struct swap_map_handle *handle,
>>   #define CMP_MIN_RD_PAGES       1024
>>   #define CMP_MAX_RD_PAGES       8192
>>
>> -/**
>> - *     save_image - save the suspend image data
>> +/*
>> + *     save the suspend image data
>>    */
> Same here.
>
>>   static int save_image(struct swap_map_handle *handle,
>> @@ -671,11 +666,8 @@ static int compress_threadfn(void *data)
>>          return 0;
>>   }
>>
>> -/**
>> - * save_compressed_image - Save the suspend image data after compression.
>> - * @handle: Swap map handle to use for saving the image.
>> - * @snapshot: Image to read data from.
>> - * @nr_to_write: Number of pages to save.
>> +/*
>> + * Save the suspend image data after compression.
>>    */
> Same here.
>
>>   static int save_compressed_image(struct swap_map_handle *handle,
>>                                   struct snapshot_handle *snapshot,
>> @@ -904,11 +896,8 @@ static int save_compressed_image(struct swap_map_handle *handle,
>>          return ret;
>>   }
>>
>> -/**
>> - *     enough_swap - Make sure we have enough swap to save the image.
>> - *
>> - *     Returns TRUE or FALSE after checking the total amount of swap
>> - *     space available from the resume partition.
>> +/*
>> + *     Make sure we have enough swap to save the image.
>>    */
> Same here.
>
>>   static int enough_swap(unsigned int nr_pages)
>> @@ -930,6 +919,8 @@ static int enough_swap(unsigned int nr_pages)
>>    *     them synced (in case something goes wrong) but we DO not want to mark
>>    *     filesystem clean: it is not. (And it does not matter, if we resume
>>    *     correctly, we'll mark system clean, anyway.)
>> + *
>> + *     Return: 0 on success, negative error code on failure.
>>    */
>>
> Please remove the empty line between the comment and the function definition.
>
>>   int swsusp_write(unsigned int flags)
>> @@ -1077,10 +1068,8 @@ static int swap_reader_finish(struct swap_map_handle *handle)
>>          return 0;
>>   }
>>
>> -/**
>> - *     load_image - load the image using the swap map handle
>> - *     @handle and the snapshot handle @snapshot
>> - *     (assume there are @nr_pages pages to load)
>> +/*
>> + *     load the image using the swap map handle
>>    */
>>
>>   static int load_image(struct swap_map_handle *handle,
>> @@ -1190,11 +1179,8 @@ static int decompress_threadfn(void *data)
>>          return 0;
>>   }
>>
>> -/**
>> - * load_compressed_image - Load compressed image data and decompress it.
>> - * @handle: Swap map handle to use for loading data.
>> - * @snapshot: Image to copy uncompressed data into.
>> - * @nr_to_read: Number of pages to load.
>> +/*
>> + * Load compressed image data and decompress it.
>>    */
> This comment is not too useful any more, please drop it.
>
>>   static int load_compressed_image(struct swap_map_handle *handle,
>>                                   struct snapshot_handle *snapshot,
>> @@ -1529,6 +1515,8 @@ static int load_compressed_image(struct swap_map_handle *handle,
>>    *     swsusp_read - read the hibernation image.
>>    *     @flags_p: flags passed by the "frozen" kernel in the image header should
>>    *               be written into this memory location
>> + *
>> + *     Return: 0 on success, negative error code on failure.
>>    */
>>
> Please remove the empty line between the comment and the function definition.
>
>>   int swsusp_read(unsigned int *flags_p)
>> @@ -1567,6 +1555,10 @@ static void *swsusp_holder;
>>   /**
>>    * swsusp_check - Open the resume device and check for the swsusp signature.
>>    * @exclusive: Open the resume device exclusively.
>> + *
>> + * Return:
>> + *     0 if a valid hibernation image is found,
>> + *     negative error code on failure.
> I think that the above can be one line, can't it?

Possibly. I will try compress it into a line.

>
>>    */
> Please remove the empty line between the comment and the function definition.
>
>>   int swsusp_check(bool exclusive)
>> @@ -1631,6 +1623,8 @@ void swsusp_close(void)
>>
>>   /**
>>    *      swsusp_unmark - Unmark swsusp signature in the resume device
>> + *
>> + *      Return: 0 on success, negative error code on failure.
>>    */
> Same here.
>
>>   #ifdef CONFIG_SUSPEND
>> --
> Thanks!
>
Thank you so much for the review and comments.
I will do accordingly and send v3.

