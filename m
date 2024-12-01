Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8907F41C72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  1 Dec 2024 04:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733027240; cv=none; b=GFOCtc8R90rzx80T0ZCZ1TMD/Oa0XHMsEd+mVnHbcMx0ATXHHLHcSFIVKlVXmn9LrEf+JCajddKgvyP+XUndsLbfSVQcCZwEPNM1PujT+jKOuntGwvB0i7XUDuOX0ksJotcOZucwmmRNy2qf5lCLG+ifya55kyrUO5W9VC1fXp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733027240; c=relaxed/simple;
	bh=2ZogH2EPnIE680Utg5LOR3b/CcSI+aOc+JmKRGVsqow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzptFl7R6y3qREHLcYptn6r7NBud95wMgg1J6PjuhRXgKF2pl3E/zsJkUDVfPNEZ6W6stpdBmY15tzNKPXMke5sqMJaVSOSaEG4Tq7L+40tdSC7q+cArylq5EVZ1dt4/oxRRWQePK1QUb1AxDlC4sSyPwP+Nr/98NVYlLPeXy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUG8HzDL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUG8HzDL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C86161516
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  1 Dec 2024 04:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJUAuDqb3C-R for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2024 04:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F56661513
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F56661513
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUG8HzDL
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6F56661513
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  1 Dec 2024 04:27:17 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fbc29b3145so2942051a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 30 Nov 2024 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733027237; x=1733632037; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZogH2EPnIE680Utg5LOR3b/CcSI+aOc+JmKRGVsqow=;
        b=HUG8HzDLopZDf1nugTVtRH0RMJGI+AJ7qIRpDDZCbAd80ECEMwBGMvyK6NOe4HJND6
         3c1wvmOJIU3tkP7jChHtYYYgUif1RbRW7v4Nr4AFL9yCF4EOKKqmOAFwJ1i+cSesR2p6
         vdFeUFt0+nK52FJS+cBO9hXIwHsM0TKtkqq0XzReb6UnbClGv1M7g42GdNfi1q215QRJ
         zByGgrtYilidlBZZMNf9FZO1CzCjwUKrj9fmavgXH5BWm4mMI8dZTBbU9mC45PMJuv6w
         FA3FpzV4PMCWPRrOU+pOuxo9t+hnS9jji3sU7eMGOIefwnNUmxGoLXi0T6ebASFCa4L5
         vekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733027237; x=1733632037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZogH2EPnIE680Utg5LOR3b/CcSI+aOc+JmKRGVsqow=;
        b=AtU67h8HpBPWQBNFaAKwpSMU1glwW9Oe+nTBJDslxH2kgxUoBS/yxe8PqXhGNQllvb
         PfljvFsJcYWt6YS0hNmMz0JSG5SDlSFrm9Gw6z5nmMdUc7cCNaJFeZpyEYE0/7AoaRpw
         iAV8h7EOHh6HPesdPKvL0WOdjM9UaxBzZdl/2WX8EEGx3YqHx9KblxuS9SHdM+DoqUog
         NV0rncVE0ZvRz0LiMpOeq0XLzaQwkfa9ThXPT1rfT939+1WI/aNWbw7Y4vdPpx8qr35L
         TB9BdNV3D0Si1h23523OAz8mPGF1qYJwrAtzexu7b6sY8CCj/h70BiIK8ky/K+68PWTI
         poCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7xuy5SJaVl1Swmh1lJVN1Jh2qZtm+i/2P85ilTmDHyprTo2FAbNouQ7mC1j0SnGwq+2dvNGU3u7TYvawd9fc96g+zaQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YysvQEc7ZZOR7O2ChbKQEtGh0lsncroIdM32I9+YWjHXMMkWAu+
	bV13dRs846Q+xfwuIEDDIXNb8AFs973NfiKgiKFNuFIncVeOSmhv
X-Gm-Gg: ASbGncskR5lG9wH6bv0e+bW6wmPVAA6Tgk08bi/+Gxi2O0JebrRMzPpDfufKApjktru
	TOFzHCLoxhTSULEcAwYog7SMPruE+aMvXtKuyDt5gN7Jwin6b7nYqMxNwLHV8nF3EZoLHSMIk79
	cghbkfuOQa6K3O/DrVoT+OZ3yPuV+K6hLkbx8J6yL9u+CcY0yTx+Dh5nB9LdcNJkMVe/TSQKvOM
	AbgTrIQJkDvVeJhCWZT/5TMkyki7GgbtZBK1yc=
X-Google-Smtp-Source: AGHT+IHV/TP3rSiKf1c6g2kaD+Zzi04s7Zfm2Zdwkx7p7gOobHmXiUjK5qu2qs4CMes4/RuVL+LEXg==
X-Received: by 2002:a05:6a20:a105:b0:1d8:c646:f51 with SMTP id adf61e73a8af0-1e0ecaeca21mr21027394637.20.1733027236672;
        Sat, 30 Nov 2024 20:27:16 -0800 (PST)
Received: from tc ([2601:1c2:c104:170:a600:8588:f159:8ed9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d3e7esm5516767a12.5.2024.11.30.20.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 20:27:16 -0800 (PST)
Date: Sat, 30 Nov 2024 20:27:13 -0800
From: Leo Stone <leocstone@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com, 
	brauner@kernel.org, quic_jjohnson@quicinc.com, viro@zeniv.linux.org.uk, 
	sandeen@redhat.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, shuah@kernel.org, anupnewsmail@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hfs: Sanity check the root record
Message-ID: <rdkuuboofty3nqjhmde667jwowcxnuo3q3mxcjrn3ip2xh2fhg@eo7aqzad775b>
References: <67400d16.050a0220.363a1b.0132.GAE@google.com>
 <20241123194949.9243-1-leocstone@gmail.com>
 <20241126093313.2t7nu67e6cjvbe7b@quack3>
 <wzxs6mjqlpf2eszoaw2ozvocqg3lpaqx7mzog4tygxexugrbsu@3pxs2vthfagb>
 <20241126215254.aw7l7k3tgx2tawzu@quack3>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126215254.aw7l7k3tgx2tawzu@quack3>

On Tue, Nov 26, 2024 at 10:52:54PM +0100, Jan Kara wrote:
> Yes, this strict check would make sense to me. I just don't know HFS good
> enough whether this is a safe assumption to make so it would be good to
> test with some HFS filesystem.

I tested with the System 7.5.3 install disks, as well as 2 disks I
formatted inside System 7 in an emulator. The root directory always had
entrylength of 70, and it looks like every directory has an entrylength
of 70.

I'll resend as a PATCH v2.

Thanks,
Leo
