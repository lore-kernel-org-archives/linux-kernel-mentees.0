Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6421684BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Jun 2024 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644320; cv=none; b=dMw1uToOJzWLWGsJ01COCXC6DMa63HtrSK9nJIKVrI+DEpCxLk9UiMDlPiZMPTT+vXK0pErjltdIa6rgVBZkan2ZKGEObWBlZuYA/6gze7UfMV6mQlVb+3F0/mLa+KCBgPBprQmcV9cNX/kzUBpMf04sPhzAZeQTjgdoQb4cc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644320; c=relaxed/simple;
	bh=bQfLNhr0U8kTl1L3wYkkfLY24a4W+lf/0ASZXstjAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiFA6DiFmak3M3Etkpsp4Y4MYKJTbnkFp1fCOIReSnkRK2ixc6/hehyBG0cjB6dc+QDX/87rlZrmxsp+NlzGtyZIiuMpr3j2qzyNLY0kyn5+DVuxmho4sGz6FmzapsOMvE9w0UcbkOJsFK3so8w/vkfJ4cV+CSzuuXBzeuvwMVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=Ncp6BMIZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="Ncp6BMIZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF34B608F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Jun 2024 17:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaJs5OhPx_pr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jun 2024 17:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rbmarliere@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F6D9608F6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6D9608F6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=Ncp6BMIZ
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2F6D9608F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Jun 2024 17:11:57 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f4603237e0so3240889b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Jun 2024 10:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718644317; x=1719249117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvckpjEpH2uOs9aOOdBydw6yHWYMDuUzMnQ/KJxhXX4=;
        b=YrhqiuOIp+LBVzvakG+8T9hz2to5uPL1UhJAOu02YgCKc2rnpCf2AD5gOLku2N7Voz
         EjD6Fw4NSYu7YDVST2b4cxzWPrUUBzW5fxCorubgdgt0vz1ZKnVhO0HsGEdHDX0wr4Q4
         /urLNg9fB22N2dv3wGrqqViTUTmUWDI8Kx01A468YHLNVMyYP4/6LQx5VO2CaD/sYdRb
         F+DgObe0Nyoez7CktnRZ7NDyH7JIOTSpRyScAJkBl2w2cuV/F6HhGafUJNQDfay17/wC
         qudxNRy/rBA45HsYbCZg4QQDp3M/M/KIh/fbsRZP2H2pWLFjyjX5JYkkB2/lNQjcxYDi
         fGaw==
X-Forwarded-Encrypted: i=1; AJvYcCVRL+j5i02KMiglZjbunyhDsc+2NuPAiMCWMmgG0mieTDHDNpo/jj4oayrVbF47rZlaYxOiZr0Xo7Cwlz3SowJFzixhl7/UD6UyidTqg/euVbFzOmIYfFUqBTtYIM0V
X-Gm-Message-State: AOJu0Yzrewcnh/Nq8ELgjUH10kz+nakiAmag1Nh5Q7CSWkkiH4STMS8W
	LcrgiouL8zihy4tgZ79qxPNm+S7VZkPcUJm/FlOeqk46WJxZ8h0D
X-Google-Smtp-Source: AGHT+IEpvx8oDxNqkEou9rQn23Am6pdR4u+cNRu+ZkVqeFYhca1Fq1ymn/C7x9An3U9SJF9ZufUo0A==
X-Received: by 2002:a05:6a00:9297:b0:6ed:de70:5ef9 with SMTP id d2e1a72fcca58-7061a9c528emr501333b3a.0.1718644316219;
        Mon, 17 Jun 2024 10:11:56 -0700 (PDT)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc96868dsm7565177b3a.65.2024.06.17.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marliere.net; s=2024;
	t=1718644314; bh=bQfLNhr0U8kTl1L3wYkkfLY24a4W+lf/0ASZXstjAi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ncp6BMIZ4pWzzQA+l0B603lgqLVX7ZHa6cr6gTLjZhzo82zVWEorL/qvIBIaCplYe
	 2a3NWK4xv63+zEk7fqibpS2L8wlh5KHpGgdA1Vc/5xEbJ7Dt/00uOFfZeyl9R4Udxe
	 rYGGRcQMT0C07ZtEwDMjdH3XCx62xmyYS+9CFJn01QochRzZg+gA2YXeTz58mbwg/y
	 9GDT5ZQUJVEblnN8K6GnPcO4VLAiNjqnpzR7c1it3E1NsFSg5OdAzvZX4wAVxvdLLz
	 M8o/JfRlBS7szPz4zQNqE4BGs1N9l1YfCdxJvT6TgLB/Ren/h1b0+9QGnIcEukAqPw
	 jR3Tc1Udee1sQ==
Date: Mon, 17 Jun 2024 14:11:48 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
References: <20240616203231.43724-1-av2082000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616203231.43724-1-av2082000@gmail.com>

On 17 Jun 24 02:02, Amit Vadhavana wrote:
> The placement of the `segdist_codes` array documentation was corrected
> to conform with kernel documentation guidelines. The `@segdist_codes`
> was placed incorrectly within the struct `segdist_code` documentation
> block, which led to a potential misinterpretation of the code structure.
> 
> The `segdist_codes` array documentation was moved outside the struct
> block, and a separate comment block was provided for it. This change
> ensures that clarity and proper alignment with kernel documentation
> standards are maintained.
> 
> A kernel-doc warning was addressed:
>     ./drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
> Changes in v2:
>     - Removed `static const` keyword from `segdist_code` structure declaration.
> 
>  drivers/slimbus/stream.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 1d6b38657917..863ab3075d7e 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -18,15 +18,17 @@
>   *		and the first slot of the next  consecutive Segment.
>   * @segdist_code: Segment Distribution Code SD[11:0]
>   * @seg_offset_mask: Segment offset mask in SD[11:0]
> - * @segdist_codes: List of all possible Segmet Distribution codes.
>   */
> -static const struct segdist_code {
> +struct segdist_code {
>  	int ratem;
>  	int seg_interval;
>  	int segdist_code;
>  	u32 seg_offset_mask;
>  
> -} segdist_codes[] = {
> +};
> +
> +/* segdist_codes - List of all possible Segment Distribution codes. */
      ^ isn't a '@' character missing here?

Make sure to re-build the docs and see whether it looks fine.

Thanks,
-	Ricardo.



> +static const struct segdist_code segdist_codes[] = {
>  	{1,	1536,	0x200,	 0xdff},
>  	{2,	768,	0x100,	 0xcff},
>  	{4,	384,	0x080,	 0xc7f},
> -- 
> 2.25.1
> 
> 
