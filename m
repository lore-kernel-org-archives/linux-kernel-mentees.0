Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD531322DB7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601040; cv=none; b=SFFfTeokl6WO+uScsuKp0eyeFiObAiIZVK7/hTS4T0giSGXwPKGosItA1HAqEH/TBh1KezQYE9EBp/3VfCPmDkzdepf7vWzQ6n6htiqiGvytfirOluKRO/VY0ku4WSwqn+97W8GBJigR8pugysiuPO/BfFpV4CVSBt9dec+m9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601040; c=relaxed/simple;
	bh=/h8vcXy6qR27gP1YZ8Yc6zSfsz6DAOWe2QXpuI2UdEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4oUWA1n4RwNR7fx0WZvyCjFEuJRIwvOMJ0GZF3fDBh8yre5LnvJDSJ4iVrono5b8BY697D+RerguJmpM85FTQ6A+V165FiyU6Eo1c2j6dspmL5Vi4NHIqG0vQah2TXpVKlxfazuI7hP6fOnCSEDTNtGWkNM/gFNVUuc6EG26/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBvTF7l/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBvTF7l/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2e89e89fso6645562b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755601038; x=1756205838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/h8vcXy6qR27gP1YZ8Yc6zSfsz6DAOWe2QXpuI2UdEs=;
        b=cBvTF7l/PuwSIoHuA8KhmeakA+j55bOQENW/uSpRrK2GikWrXEq16y5/Wfsyzhd442
         M/qsP74N6D1Bl267SSB11Zj/gtyezZW1qFPJESfqgAOGm/6PKkZIGgsOAMfmhj8ucuvw
         vebsdKzSOqpUhO0+BD+xu+Ju1u6VqzdppNhKMBgTOGx8o2CArIg5p5bmj0V29yfor4Tr
         Bn3OhZGQ+CXJOWNd0uUHF0ezQBT2edjTz2eHXqXCh/6Yn91f0o23ucV6BEkf5AHiP9j5
         YDCP9/dUlTSNPLSgX1ZrOjZaH9OSIQPUJmCGf1XQ4Z2BmC6cjbl7oh3WhxGS6OLoBLhG
         JtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601038; x=1756205838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h8vcXy6qR27gP1YZ8Yc6zSfsz6DAOWe2QXpuI2UdEs=;
        b=izZfWgFDrigd5tsNILFpEicJQBVbe7ENUdjGl4mJXBnDQACiSIbCwPhonWPapeGHm9
         sIrpm6EuU7CAeefbEUjgF9BwqayliRvnoVLC2pt+4L7CBPaWUjMWY4TyrWVl7v0FxnMl
         p1IEFvzSEZW2r14Xi86xvzQ6VZCe975Vtr1mUy5burxiSrpiAXq8igHB9kL7SPBxFzSa
         ebolk/YQcL23u/Wk/jaGJGrR9pHSCt74rJdyzR/BDnz9tTS3eVqLZVtFF5g9/EFpsjPx
         Tdym+n4xYlsuRMc2mT7lsf9geBcONfVZ+KW8a5oQt7qk2PeuKB5SlDRtA3+rORnsyhEd
         RLQw==
X-Forwarded-Encrypted: i=1; AJvYcCVlpHrjO3XR1G1i7pYAz8jov2u/rTB8gRL2BiWQMV6i6TiJZjPfieT4A4Fn4stmlWpB5CfQ6p0pLbNx6O3nL1BLwaPEbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqwq11Ffmv7PItN3Uyrdtcm2BsvukB6icKoQxb15zD+5sFouYK
	p1UD2ydg29EtWS1dz89JWe5GNwegb58sM53ETeNM/XUz+1GB+95saTMa
X-Gm-Gg: ASbGncvisa19xRqaQilZexR9Cs7G8kmhvKjckB5UDpBpBvKbGC0oV/I1XSGabieVYAN
	R7VVEMeLI1PLKULxEFIhxbxVoCWfHtJmT0Hafv0/dlWC/ASIl9qmNozvSpLEbA5W55QNkyy9PbB
	y0ihUNfNK4R1xcKrfyINhYtHqSUup9/YaH4DqtTZ54yyUA8RFGphBr1F8jMD24bBS/HP/ZhvRuD
	gyaFkftJgA9HX7gBrGHhpvtBVJRnOBqgnQzbCm7/R5XyrHs/rUPkE8m4/0WqDuHTTPQPdk5yK3g
	aaSwvXkhygRpo1OZdjmBwkTMehkQS3inzEDGeLWYT5Z+803R8MUzFOZpmJq5HApSlRW70JNdgu+
	WvcFjdDf23WdVFMIsnA==
X-Google-Smtp-Source: AGHT+IEHSyz6oaDA7K+RvMSncY8tbf2c7olIXCrk48S43s9RumALFVRcBntKKJA8rU+d1WXngphnug==
X-Received: by 2002:a05:6a00:929c:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-76e80eb487cmr2546976b3a.1.1755601038024;
        Tue, 19 Aug 2025 03:57:18 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d130cfbsm2218152b3a.40.2025.08.19.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:57:17 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:27:12 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: tzimmermann@suse.de, michal.wajdeczko@intel.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	simona@ffwll.ch, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKRYiJec3VE7xo7J@Terra>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
 <CAPZGEKyhn1LLZQ7z04_u6pjTf9Uqy+ycH4t7xYMRe5dDR9Vg2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPZGEKyhn1LLZQ7z04_u6pjTf9Uqy+ycH4t7xYMRe5dDR9Vg2Q@mail.gmail.com>

Sorry for the html attachments, I forgot to set the email to plain text
based.
