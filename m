Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65494D8B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721849447; cv=none; b=DJr18OkTWIHylaNTVZmPDA0dJckruKmE60mJOqnt58SGiLv4dL1V+prB3SnGl2wcUy+jApLiCpezHY+woHvzJe+Pv4VgNELNg2C2qFlXCfBWZn/NRMkvswq3YWnHh5mQaIX8397xb/i2MCEBUyT4/b10NFEgfJBUuy/GnYHc7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721849447; c=relaxed/simple;
	bh=CwcrVl/60DWCLtqD/z90jzM81X9qJdKWNTrpQsA9+jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boXA/RfLhwDk/TVNaO3TYA2RsquXml8wfmgi/3MjBDaAMEam3uEzdt38xrBCJcXiTjdTRbBB8tOxwaPLQut80WNLxf+uV2Bo/0ZQFDi/os79bPgYXUFKsFbj7bdTS8mAczXGzTU845i0Nnhz8HUEIIiMpCb7v/30RT/9uHFZsq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH2YK5Q0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH2YK5Q0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D2B6065D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sEoL0VwBdAd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jul 2024 19:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=rbmarliere@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD63D60655
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD63D60655
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eH2YK5Q0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD63D60655
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 19:30:44 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so105710a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721849444; x=1722454244; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4MvnsTGWo0THFyPD9MrsKyrQPqeYvDANUUTqm+As1o=;
        b=eH2YK5Q0wiItHuhgas0ypcKkV4GzqGwiajWAmFTBbMiFvfrIzA6OeBMsRg8PaPoQfp
         TWZeXb+kImKOkcCpp2IE3ZcIEPvoT43JQwfuhKw/reS9t5dceLVStf+ch7XST+HtYd95
         byN5j8fNAXl1jfU142934c827jC64fQKq+rhTORlGvpzwbm1C1NFfXSHXwQUVzbi9kaz
         Z/qDDD1vKbDh0uiHJd88zvvJiNAgK+Oicn4Bn7G2472ia4Yr+iwtAvHPbJx+30mncDYQ
         cbk/kjDmg6vSxChtmxDXHag9p2MSb4oq8pqmkVDp49QpFhYrCP4sr/TTiZtjonXTw8PP
         4R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721849444; x=1722454244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4MvnsTGWo0THFyPD9MrsKyrQPqeYvDANUUTqm+As1o=;
        b=RAgeEnn/wj+2S9/a7oHFZ1EnY57FPxriZoOmBehkJKvp3vPIsOJ5Zl1hQ4ERSQlqPV
         UILc5kgJ2x0yuvjWEv4KRsU9j/lNNvbYr4Q9HLz224cHFAKg+IV58UFks7VN6cSCFLnZ
         eJojXkRZIGTlgkqzbVFTR0OShEchqkO8+66tcqr8qh9CqE/vyrPwNDOswQMICcaVT7tq
         dQJBE70izh1+IDTeUCO389fs65DzdDKAP+LRnIq5rThDuCsuEjipl/2PgLokmtWFmEs6
         +oBAXIEW/CIWdF+8S92QpnvCUEVn+fPwqMzRAWl1PCKUHiF5vZtpu7LhVYpOQ4iY54R6
         SouA==
X-Forwarded-Encrypted: i=1; AJvYcCVzZyHpeOxPv0x25MvXdt9HI9vwSP3vWILwpBvJVjJZww0kdPfP4z7BgUs38NPpn+2o4DAZz7Jscf+9H8Tpl6W5TuTvdNLkYUItMlcV4DUZY9GxYvhDMrBe889+ccIj
X-Gm-Message-State: AOJu0Yz5r50dcc1HGh8Yk4N3nAkHflGDr6ulJb9B79i3JpB5RUcBwP/D
	vUjuUsB7bRNvTJfglpnX4koI77ePNzkRLjIoHHT0RXKeAK20W5fh
X-Google-Smtp-Source: AGHT+IGeMQuCgTIh3sLr3bbX2Tu5TYy4tqK2HRcEnZ6n/KheSClihGZCYHx0kW/iSQRWZ+Lsku7jpA==
X-Received: by 2002:a05:6a20:840d:b0:1c4:2469:f893 with SMTP id adf61e73a8af0-1c472c6d61dmr1229216637.46.1721849443832;
        Wed, 24 Jul 2024 12:30:43 -0700 (PDT)
Received: from localhost ([2804:2484:804c:b67b:f1b3:b8d7:cfb4:98a5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1971a5bcsm6395578b3a.0.2024.07.24.12.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:30:43 -0700 (PDT)
Date: Wed, 24 Jul 2024 16:30:39 -0300
From: "Ricardo B. Marliere" <rbmarliere@gmail.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com, 
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, 
	christian.koenig@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	marcelomspessoto@gmail.com, aurabindo.pillai@amd.com, adnelson@amd.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
Message-ID: <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
References: <20240724175423.18075-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724175423.18075-1-abhishektamboli9@gmail.com>

On 24 Jul 24 23:24, Abhishek Tamboli wrote:
> Fix documentation compile warning by adding description
> for program_3dlut_size function.
> 
> Remove the following warning:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function parameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 40a9b3471208..615c69d966e7 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -1039,7 +1039,21 @@ struct mpc_funcs {
>  	*/
>  	void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID id, const enum MCM_LUT_XABLE xable,
>  			bool lut_bank_a, int mpcc_id);
> -	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
> +	/**
> +	 * @program_3dlut_size:
> +	 *
> +	 * Program 3D LUT size.
> +	 *
> +	 * Parameters:
> +	 * - [in/out] mpc - MPC context.
> +	 * - [in] is_17x17x17 - Boolean Flag.
> +	 * - [in] mpcc_id - MPCC physical instance.
> +	 *
> +	 * Return:
> +	 *
> +	 * void
> +	 */

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>


> +	 void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
