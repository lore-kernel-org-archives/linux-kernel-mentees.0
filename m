Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA372FBE01
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763769119; cv=none; b=if1w2qxwPRRzYp2SUsxdE29yu/8ZdhPMU6VSTx2yR3bqqN5AoIkAz8ofxEtpZ0HGCaCjyjrNth5FBUEKijGoSzPA5kFzIYXVNDevQr3/04nGPuOrVUzxsdcsDSKR7kyYrwQmi6R7wEMKwi5szKM11PugDLXZnauqKA7ObU8LKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763769119; c=relaxed/simple;
	bh=qyIgkIWEPVtK3bvaf33iUXx+Lwkh8VwskyaNpGQA3FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKqTLi5sQdw/t9S/tH8xCY65w0Ub4einirbRcYmfdss4mQaNuO+bEBqolhjxWctopSOfWieHBuLIg2leZCXWebKXXAdBV3HCfHforUgc/H8VDuTaZh6vRwfZlGARhWPa25BXaYLj5fJVls+wl9m5YulFDUDVTX6XV/kMB2wTHFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pl/EffTw; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pl/EffTw"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF174052A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 23:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emAuo0IG4PFT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Nov 2025 23:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAA4540262
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA4540262
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Pl/EffTw
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BAA4540262
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 23:51:56 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b2aa1ae006so321335385a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763769115; x=1764373915; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SNFKsTnzS74A3YnRADAbN00lA3dVz8Z4Yjm0idBCQ+0=;
        b=Pl/EffTwxl9E4pPXT4FwSaAkoonhnS4JgL16W4y+KelroYyen+QKLR7s0E+dVcstQP
         JFVicKpE6W68goLzLLSE9DOvSrGljNVU6FqUDRnvbB2Uczm2Ujg5tlyvfGBD6cSZ1NV/
         vdU6iYu+3xCNht8OXaFWJswjuxe6K+j1I3icQNE16kgIzQPKjlE2vTdDi3gVacRqKjzk
         g2NfsDglwCzFMPhEf3M4N5/66/Frg6K1VrcWsD7nyjPvd3zQSRVH9I7/f0w79e/Us2U9
         7ehHqDNGUoD9iADfipGOdUTvCJkqbWs+D3GGcFmBNW8NJJeqMDmDstdCDv0hZx9Ccme1
         9rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763769115; x=1764373915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNFKsTnzS74A3YnRADAbN00lA3dVz8Z4Yjm0idBCQ+0=;
        b=oF9FV9H6ylWy4qcIk4u5nBls3q9WKnmdBZSXdRplwfE89M1fI+uatqRKy2rnrW33XY
         KsanoMgqCR4yIuGqEE5AoDTbaAy4gokB52pnekgJH6juqQVGOCFB2wH711RzEmyhe92O
         gT3J+5azDWmsFNCQDZO8EJp6ebx3o/matL0W+fHH1Xft0w4Vt4GZSCrOj/lrm/wJHf5t
         hicZkVkfRh2urIaqy5BzPbmSkHZR6i5cPTVP/wX/LtBhVuiWaOG5CrBLFDbB5ZW1AWhE
         6e9VokWJy+/uC6LU/T2wnaBx0+u9lIjzLWjkoHPFWZZEEI3TzkBMc9XYJnJWavX1TMJM
         JhLg==
X-Forwarded-Encrypted: i=1; AJvYcCULCwxG9FP/QY4UeKbEBPfZbCyB7+tVcGlpaP8RlCxeIpMxYq/G70djyP5IfnAz2t6X4kRRZ+YBiwD884KaMjhpaaOusQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwaDABhprEzSro+I+Zig1y4GvQ1f6OyyRbYPzkc+qj8BOsZR3vq
	pB98V0tA8y2VUHfIDHOkynWCdmkn5ht8Xoo1M8hdBE4QiiDoKICMlVJQwwotZlHs83k=
X-Gm-Gg: ASbGncujwxvie2wE/KqOyTJFLpAfZynHAej98+zeqW7Yt8DeorYuyycyX5SaOiKpSJK
	nJnU7bgGhP4t4Z3oI9QleYREC+gNZW3qn2Xsi/XnECJ4Gh6CSNhUmRHg2tGs1EkBifhHhQ61hYV
	aTaCFrFku+oy/fH4VquuLAyhWC4CinQ1286tA+sHoSN3981Fjic1v9wfCO3+4Uy1TdRiz1Ksywc
	0sn887FvVbVHhlr2D9zXiv5q8UA1j3pxzbDfZnZtwOOq1IBF8pPfCTP0klSJz+3miWoK0qy6G/g
	hkeFnnxXEt64l8uxIV8pxLJrkM/c0OCLw+a6BCq53cVBRyTkeWLcGQIR755LAWJ7kEPS+F/u+hR
	/9jvzw86b734L24nwsOS0bvKrhRTDqW0UlKQQXe3MuhIECnE+cRPkzip55BMGRZJf09SgNgSXI6
	ufNw2ub/I7++zcmT7znneMJo2L5csMSVVL58c4m3n/v7w4PAjxYXNnLn8K
X-Google-Smtp-Source: AGHT+IFWPATCeCmWOiB88Xr2ysxytHvAaGgMnVOpuF76dOClmpd6DtTQfeYA8jncK9mJHMi6OC8ekA==
X-Received: by 2002:a05:620a:470d:b0:8b2:e666:713 with SMTP id af79cd13be357-8b33d476f8cmr539235785a.42.1763769115207;
        Fri, 21 Nov 2025 15:51:55 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db543sm457101985a.38.2025.11.21.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 15:51:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vMauv-00000001bzu-1Ue0;
	Fri, 21 Nov 2025 19:51:53 -0400
Date: Fri, 21 Nov 2025 19:51:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/iommu: Fix array-bounds warning in get_hw_info
Message-ID: <20251121235153.GK233636@ziepe.ca>
References: <20251113200854.429515-2-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113200854.429515-2-nirbhay.lkd@gmail.com>

On Fri, Nov 14, 2025 at 01:38:55AM +0530, Nirbhay Sharma wrote:
> GCC warns about potential out-of-bounds access when the test provides
> a buffer smaller than struct iommu_test_hw_info:
> 
> iommufd_utils.h:817:37: warning: array subscript 'struct
> iommu_test_hw_info[0]' is partly outside array bounds of 'struct
> iommu_test_hw_info_buffer_smaller[1]'
> [-Warray-bounds=]
>   817 |                         assert(!info->flags);
>       |                                 ~~~~^~~~~~~
> 
> The warning occurs because 'info' is cast to a pointer to the full
> 8-byte struct at the top of the function, but the buffer_smaller test
> case passes only a 4-byte buffer. While the code correctly checks
> data_len before accessing each field, GCC's flow analysis with inlining
> doesn't recognize that the size check protects the access.
> 
> Fix this by accessing fields through appropriately-typed pointers that
> match the actual field sizes (__u32), declared only after the bounds
> check. This makes the relationship between the size check and memory
> access explicit to the compiler.
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>  tools/testing/selftests/iommu/iommufd_utils.h | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
> index 9f472c20c190..37c1b994008c 100644
> --- a/tools/testing/selftests/iommu/iommufd_utils.h
> +++ b/tools/testing/selftests/iommu/iommufd_utils.h
> @@ -770,7 +770,6 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
>  				 void *data, size_t data_len,
>  				 uint32_t *capabilities, uint8_t *max_pasid)
>  {
> -	struct iommu_test_hw_info *info = (struct iommu_test_hw_info *)data;
>  	struct iommu_hw_info cmd = {
>  		.size = sizeof(cmd),
>  		.dev_id = device_id,
> @@ -810,11 +809,19 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
>  		}
>  	}
>  
> -	if (info) {
> -		if (data_len >= offsetofend(struct iommu_test_hw_info, test_reg))
> -			assert(info->test_reg == IOMMU_HW_INFO_SELFTEST_REGVAL);
> -		if (data_len >= offsetofend(struct iommu_test_hw_info, flags))
> -			assert(!info->flags);
> +	if (data) {
> +		if (data_len >= offsetofend(struct iommu_test_hw_info,
> +					    test_reg)) {
> +			__u32 *test_reg = (__u32 *)data + 1;

This seems too obfuscated, can't we keep the struct somehow and still
remove the warning?

I also feel like you have a compiler bug here, if gcc has inlined
enough to know the size of data then it surely should know the
constant value of data_len?

Failing that, how about just change the caller, maybe like this:

--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -760,6 +760,7 @@ TEST_F(iommufd_ioas, get_hw_info)
        } buffer_larger;
        struct iommu_test_hw_info_buffer_smaller {
                __u32 flags;
+               struct iommu_test_hw_info dummy;
        } buffer_smaller;
 
        if (self->device_id) {
@@ -791,9 +792,11 @@ TEST_F(iommufd_ioas, get_hw_info)
                 * Provide a user_buffer with size smaller than the exact size to check if
                 * the fields within the size range still gets updated.
                 */
-               test_cmd_get_hw_info(self->device_id,
-                                    IOMMU_HW_INFO_TYPE_DEFAULT,
-                                    &buffer_smaller, sizeof(buffer_smaller));
+               test_cmd_get_hw_info(
+                       self->device_id, IOMMU_HW_INFO_TYPE_DEFAULT,
+                       &buffer_smaller,
+                       offsetofend(struct iommu_test_hw_info_buffer_smaller,
+                                   flags));
                test_cmd_get_hw_info_pasid(self->device_id, &max_pasid);
                ASSERT_EQ(0, max_pasid);
                if (variant->pasid_capable) {

Jason
