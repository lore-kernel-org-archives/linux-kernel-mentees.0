Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511728B519
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195717; cv=none; b=sTsTLntF4lHWUcYA9ZV1R9Btn/bf5bejNOIzfZDnrEan+bRP4KLQWIHNReUPc7IEo6Qt/sWJfnVXJQ8mFXB1EJ6x4hCa2tIyzkS4KYGjkUJaquIES3AR1XrMfzIyXA3YAe6GGq/jXHPNL1q2aUCx+LhuQzmKQMXLQryWKzVhYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195717; c=relaxed/simple;
	bh=4MtfDle0WG7Uv4F9z1b6HHt/I+hDlg5Sid0y9Zgz/MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rz06cJS4rx/Pz8rmUIugJEpQTnz9BsVHm42HcRo6BJndXobsDH+wqqyHhVWlJwtJx5m1MtxMlYh4XDpy3dnjYkBIUAVxOeyDAcWfaCqNvELuaonlSWQwh9dPZ21k8MP3FpaK2dSlatwWXxh5bbElGN8IpmMdlHmQXEJOIYxX5FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nij5DuHi; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nij5DuHi"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e64e87d49so3306300a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753195715; x=1753800515; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MtfDle0WG7Uv4F9z1b6HHt/I+hDlg5Sid0y9Zgz/MU=;
        b=nij5DuHiqlwJJhmYJYPHxkJxoZfIP3aAKEIAmJjT+KpIRFaU6I2adx6jyqAMAEAHl8
         NE0F3sO/zfcVJ0WKSLBClYq2qd3pxlm3gsXzpux2g+eYRK5ZWKmTyrDQF7bGJ5JzdF9/
         Kkt3z3ErvdT3XE/xEv0DLsP/rDVrsnhJD3h1DrjjOEAq2yJch6Yy1FVDkWPjsGUtAa04
         cvGuLAbOPCfwTWFRGzjM7+HWKlyHp4BPfRJ5lp8q/kwu0rS9lFfp3iTouvV4MGW2gfez
         SeNYPpLOj/0ZavkLs7XXUAPl9mwsEYeiMhnzJ8CMnQ//MENvDdeL5darTkyFhBhyCSQC
         4y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195715; x=1753800515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MtfDle0WG7Uv4F9z1b6HHt/I+hDlg5Sid0y9Zgz/MU=;
        b=gdtCssJdrBeECznLXW9k8FEYLKoPSuFD2X3lIzj1iN+4IlaQa1wIbJgxf0pCHm4w8l
         P8PsERQudnoDdS/qZFOdZ6syqe0Ts5Xyora5N1p/O5hb1rzpU/uOd7G0e3g8MRSpC561
         hMjrhf5NqVrtLTuOFrzNu2t4kmNc8JiyjEgQ1oM7weMuqyGjm+sNL98sJrUlRgkKvMwp
         Sk5GHXCSN6L40oS9iArG6uayjfzv5DiAey1A6vLVY6T1tL24Zgt2lle5Fiai2lOoWOMZ
         Ke/NvLxDt8BqjWymI2doCP2K/FbDDWWcEj+u3R6EWoIenxOA5T4zOq264btvl5rIR2UB
         cidA==
X-Forwarded-Encrypted: i=1; AJvYcCV9UmSTJ1AbE/xXsYdHkifyHqupypGyRTh7pFCMXyJ9JJ5rg2u32gjME8miNCYLxWZeDsIZcCTGvvfK/T6yVapfOB47fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+oPnD5pwQsMKlCeU1lmTtXnGZkho3K5+jGCelU+c37zLkJFp
	rdbO/dkHAsc9LIharI0xsiEUBqOp/B1yp/R/1pllaEmhbuLJXoAyLVX3NTSfHsqT+Zgui8DSC2Z
	OdZq2XLJNVL9SIKFn0b6eDWwyBrB8tTw=
X-Gm-Gg: ASbGnculUmDyAMnMUz6zLO9SN8+QaXiwtzVtS0Xik0hYlbqvYfbULMcLXa/u5Q4/CN+
	sQMkutCY33vvokYtjN8iq8sZYSVEXLCFLdn7NNjwJqeDfbEnAjenhuzJo1XH68pW/PUvwZNWfQ0
	G9EJWGk+JiZvSoz+op+CGFx8dbme7egRW/SnkJPbWhq9DW3+CNCcrql3MW51AHPBv1yfW/7SQdI
	sarZ010vGz47y60fHQ=
X-Google-Smtp-Source: AGHT+IEG6weuk3u01kWhYmKNrNFH8KtNbCdNFtt5z3JdnOQTxFy2cESFvYQBnksX7pF4BWCXErQiIra2xkerjFPulHg=
X-Received: by 2002:a05:6871:d810:10b0:301:db6b:45dc with SMTP id
 586e51a60fabf-301db6b98famr6726378fac.11.1753195714985; Tue, 22 Jul 2025
 07:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <20250722063659.3a439879@kernel.org> <CAO9wTFhghrrzH2ysTiBqNrZ1dbb001Y6rWYiKRTC2R8PBm-Zog@mail.gmail.com>
 <20250722073330.5bf59b6d@kernel.org>
In-Reply-To: <20250722073330.5bf59b6d@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 22 Jul 2025 20:18:21 +0530
X-Gm-Features: Ac12FXwSanR5YTRf_oRfMzLZcHJJHxNyTZr2BTs9dzHsoqX6MSu3EbQIzv3w40A
Message-ID: <CAO9wTFjkTbwiT3vCVX9j2UwFdF947NbxpUpzB9iyPcxYxARtUA@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, jhs@mojatatu.com, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, sdf@fomichev.me, kuniyu@google.com, 
	aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Please note that in networking we ask that new versions of patches not
> be resubmitted within 24h of previous posting:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
>

Yup, thanks for reminding.

> > In the meantime, could you please give me some insights on testing
> > this change? Also, apart from the unsigned int blunder, does the
> > overall approach look reasonable? I=E2=80=99d be grateful for any sugge=
stions
> > or comments. Thank you.
>
> Hopefully someone reviews before you repost, I didn't look further once
> I noticed the static analysis warning.

Alright, I'll wait until someone reviews it. Thanks!
