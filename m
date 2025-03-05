Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F657257AF9
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Mar 2025 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211356; cv=none; b=AKgf+0+bpXWwhdi58CDyWnF37FpLXeUvpgaKNkAs0yVuF3NJzgTY44YtKhRP6IFlc1Rg9hhdL1elkTg1IDhieNbWzkLMUeDzfBTzAtRIH8cwelSEn0Zh6KeXHA5rcFuGZm2B7cNidSX2z+ABBojiirCBgRPQodZqeVzj3wsIMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211356; c=relaxed/simple;
	bh=EkMRTYZI41o9lStwnMlleZqWRQi6QzJ1U+G8jqGCdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA8Hm9Xt7Wwnn6QPVos49MkGBv7Zfvn6RzXIrXG1HgzFRcpeQHCn2aAYE8Oso5ju7qJ4BnH1er+hP67/D/L0RT6HKiQqqS0Hiflx4YQKA12+nxoKx0USBcWi/J3rFZXCnap8WHJAklx8nAIHQLOekyi7oNPpx5kPdd7ApRKbwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TmH5mgsC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TmH5mgsC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2234e4b079cso136217375ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Mar 2025 13:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741211353; x=1741816153; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjoSc6E8cjM2Yo8eK5HFN8pI09NM2S8qt1nM/UlA0TU=;
        b=TmH5mgsCoxFaMLjh8ubsYhMxIUZKKMDXA4iB/MkS8Yk57fSCbXTgIW7LskezZV8x1z
         f7HlYVCkHyVm3sTSumIKKdHdq7YvwwaLwi4+ORKL2ij3vPWYfgcHBa9B3qxRRQTrbqi3
         xg/Xfu7eoZESegLj+O6Un+Qkucg0rPyL3ESn5iwmlDIZYiXbuv/jdGuxxeZ99XK3qHwl
         N9tCnpo2ZIhF3Wvv/cUH9RrajoToMoPn79ybSYPVx8G55qx8QQi2iESSFKTQh6BE4qAz
         yvmgpe8iapxSOA3Wk3Lz2zFnNWrycWpBiaU4rQxvo3JTfqaYQijkjQYOBhILZvwciW9T
         AuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211353; x=1741816153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjoSc6E8cjM2Yo8eK5HFN8pI09NM2S8qt1nM/UlA0TU=;
        b=mNlbqy4qzooPgwe+A3ot40jORbGZ6xFNglXuiJ4e5dB4yGpkRIf+RCV/mD2oo3fIPZ
         bxcSY2MNTuNjQLlUS+eG3E22NOVCaHa1b8M/AZQhjhNvMMUbzdKBOnSZGKFIk6MR1Wui
         4MxNxhZQr3GwNrpB+NBskUW6ioDtrWyFAx8tWbBIy5uM2P/BNtDl0wu0quRQ5MlbfuWf
         PDG5YpuFugaYZq1DAKSMVwVa640B4KlboGqIOo/KNj58r7WQJ91hgfN8iiRuWGjqgFZX
         LO56DGx2v3uVysZ9mfHIjpzEKO2AOrmW9FuseFcn9F7HgXl8MfCVQ02d1I3tmkrgYb/P
         Yg5Q==
X-Gm-Message-State: AOJu0Yz4a4IGOeiLdc9kMUzVKT5vCkFNWmqYb0J/MzloShKL9Qt/gv7G
	5io2i3BrXR0yBzLfEaWkn0Av1F4/mtrSHNvjDpFxH5JfxOSOycv6or2rlEaU4sQ=
X-Gm-Gg: ASbGncuzxE/FtNfjTbNQqf94kighey6ZjMYu3hMOo1PfQMxFbyMii/TY6tnf7+kyu3b
	23rYro9mqKAK3xoHUvnptPvz1va/ePPlvnd0ApTYei5z8HhuIwgMBE7XtHov0f1cy4+EB0UZyHp
	WhXh3L7WfbH+03dpehMSnP8r+vokOQCUdi68FxH75JuisiQFdYE2dR7VGNSEQDR7iidksyGem4b
	PrVzLB79PMJvbAlzYZWPtH9Jr0VtuAaq0oAy2lVc9bvsu7HgfurIkbZv8WC25Ixv3+eiWBnNlxT
	wsz018d1zNkIZIi9NKanrtehcZgYYrCq3Hvu/Qep
X-Google-Smtp-Source: AGHT+IGiq/MXIy1PesAIjd/q+Uj1GRVM25G7HYgqYDLVTQNdRiqv0JEG2/8H91arLf8HKxgXjRaCBg==
X-Received: by 2002:a17:902:f693:b0:220:ca08:8986 with SMTP id d9443c01a7336-223f1cdae3dmr83408555ad.22.1741211353117;
        Wed, 05 Mar 2025 13:49:13 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9b3c:3246:a388:fe44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8fdsm117591535ad.76.2025.03.05.13.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:49:12 -0800 (PST)
Date: Wed, 5 Mar 2025 13:49:09 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
Message-ID: <Z8jG1ViOUbw79cEN@ghost>
References: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>

On Wed, Mar 05, 2025 at 05:39:28PM +0100, Ignacio Encinas wrote:
> Vector registers are zero initialized by the kernel. Stop accepting
> "all ones" as a clean value.
> 
> Note that this was not working as expected given that
> 	value == 0xff
> can be assumed to be always false by the compiler as value's range is
> [-128, 127]. Both GCC (-Wtype-limits) and clang
> (-Wtautological-constant-out-of-range-compare) warn about this.

This check was included because the "dirty" value is an implementation
detail that I believe is not strongly defined in the ABI. Since linux
does always set this value to zero (currently) we can safely remove this
check. 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> I tried looking why "all ones" was previously deemed a "clean" value but
> couldn't find any information. It looks like the kernel always 
> zero-initializes the vector registers.
> 
> If "all ones" is still acceptable for any reason, my intention is to 
> spin a v2 changing the types of `value` and `prev_value` to unsigned 
> char.
> ---
>  tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 35c0812e32de0c82a54f84bd52c4272507121e35..b712c4d258a6cb045aa96de4a75299714866f5e6 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -6,7 +6,7 @@
>   * the values. To further ensure consistency, this file is compiled without
>   * libc and without auto-vectorization.
>   *
> - * To be "clean" all values must be either all ones or all zeroes.
> + * To be "clean" all values must be all zeroes.
>   */
>  
>  #define __stringify_1(x...)	#x
> @@ -46,7 +46,7 @@ int main(int argc, char **argv)
>  			: "=r" (value));					\
>  		if (first) {							\
>  			first = 0;						\
> -		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +		} else if (value != prev_value || value != 0x00) {              \
>  			printf("Register " __stringify(register)		\
>  				" values not clean! value: %u\n", value);	\
>  			exit(-1);						\
> 
> ---
> base-commit: 03d38806a902b36bf364cae8de6f1183c0a35a67
> change-id: 20250301-fix-v_exec_initval_nolibc-498d976c372d
> 
> Best regards,
> -- 
> Ignacio Encinas <ignacio@iencinas.com>
> 
