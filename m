Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2B39FC3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH/gbnwT"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7788ebea620so460796285a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700067462; x=1700672262; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1x9R1YSMtIDXOY8NGRNz1DEQdPm/O2O78pgU5S8Hxw4=;
        b=gH/gbnwT4zFIP2ZnBw0q1bhuc1jF3sTs0iHSpw/ih864felLmvkQuRFe34dNTP44B9
         14NrifVQHCA7BMLErhsSBYa/XVMYXx2ucRSqY+Ls2CksGBa0Xr19ApWyEeHXw1z+7Hdo
         AddJwU2S9Vcjpl6x890W/E6jyKduD+p/XQj32jDR4yJ89SooUZyRDirlqfs4pZauN7Cn
         arhOiZcgWFOtlXZUVWiNfy5Kkf9F6JbwBASlu32aWTfSLwZDxKcwcq/hH6LugsPojgtS
         Q+GCGONbA2giJl3bRyviEFHqr6jR92Rt0n4+437WU3OAwf1tsPN7tP9X1ciZcOTx256y
         DlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067462; x=1700672262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1x9R1YSMtIDXOY8NGRNz1DEQdPm/O2O78pgU5S8Hxw4=;
        b=kBf8ZigXuWh8bkyMHx3bo6npjSVw6tfqtgFcuAExx4XR6KZfAsTKjF905wpo38IVOj
         AZTI9PHya7vozPzwl7j9np5hiKV+0PTLCItTDz1AjJkSGBe6rH3r+Gooq0XGlMpYwbcC
         wY6ENvsCiKfRdGW6EkAB8O9BVlg4DkjhXplqUL+YoeIcLFHCbRlQ3sveG/cZ/g8tBgIQ
         zDuE7rep2jSGy195ajrLk7xkcLUWK2tfCEkx2J6beWa5zlkejkjQ59sR9tyjzBLVyLa+
         t7nvFYDTOuAptzRLLmD2wKYFfMrcwrjp1rjXqKpzCMBmMK8siiTuzepPIuSGlWDXyIlZ
         jN5A==
X-Gm-Message-State: AOJu0YwkAvTWwAkbblBNY4qHUxxvH8FNXSSRfHIC/99DL9F3yXKe7FBK
	LmnR+ghCV/x6vx02PHqD7bw=
X-Google-Smtp-Source: AGHT+IFz+mw4hPmT4In3mdPGGl4jilSo2flRmV/qc0FnnkrlDaXtzRHshv+tlmwNmEUBGLkOQhhwWg==
X-Received: by 2002:a05:6214:c25:b0:66d:1624:2203 with SMTP id a5-20020a0562140c2500b0066d16242203mr6753177qvd.20.1700067461669;
        Wed, 15 Nov 2023 08:57:41 -0800 (PST)
Received: from google.com ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id a5-20020ad441c5000000b0065af366bdc1sm655942qvq.103.2023.11.15.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:57:41 -0800 (PST)
Date: Wed, 15 Nov 2023 16:57:38 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Cc: skhan@linuxfoundation.org, rrangel@chromium.org,
	jefferymiller@google.com, linux-input@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH RESEND] Input: synaptics: enable InterTouch for ThinkPad
 L14 G1
Message-ID: <ZVT4gorWmFwNvGU4@google.com>
References: <20231114063607.71772-1-jose.pekkarinen@foxhound.fi>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114063607.71772-1-jose.pekkarinen@foxhound.fi>

On Tue, Nov 14, 2023 at 08:36:07AM +0200, José Pekkarinen wrote:
> Observed on dmesg of my laptop I see the following
> output:
> 
> [   19.898700] psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
> [   19.936057] psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
> [   19.936076] psmouse serio1: synaptics: Your touchpad (PNP: LEN0411 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
> [   20.008901] psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board id: 3471, fw id: 2909640
> [   20.008925] psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
> [   20.053344] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input7
> [   20.397608] mousedev: PS/2 mouse device common for all mice
> 
> This patch will add its pnp id to the smbus list to
> produce the setup of intertouch for the device.
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>

Applied, thank you.

-- 
Dmitry
