Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2959E14F90
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753853745; cv=none; b=GHOHPoIIozyLtAOv84DDPbKH7H7DNT5Jpk9XiXIWKS3M6KlC5NYHhI06Kq0RIMSG2+AMrgdivwR0qyG2f+oaMk9FupWEHjUgp70Zem5BqfqOqbQEUU4Gb9/p9yzbtQ2bn+QpD5KNEporF38A+DQZ3HrNCOS+62Er3PFohLMQF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753853745; c=relaxed/simple;
	bh=GNrrR+zxmWPBJfDAKkGoRhAm/wUJ6NSUTG9UuP4yaC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4DLGX1qatD6CA1pGcGhqs5ql0tWcfbVx5uiU2Gw7KxbJ8whBRoo6cP9QJvz5EozmFpe5+6d7vkd2dg55QWj8J/iqjsOvfEQRL+1O3JLb9GKnuH1sbJhsyFfSW/4ybgToS+byEdh4VagUxXH+MOlwulQ4jO180sbnrlFhC8g0l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftbhPKXW; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftbhPKXW"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-303058a8649so2129625fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753853743; x=1754458543; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lH3zTOxyYIDrRfVJOd6RDOdJmR7U0O0pjlTQ+4sW4aU=;
        b=ftbhPKXWLXEB2/3l2Zw1rBYabuVB0v+1yAmeE4oVNxiy6Pyp9+DEqPHW5podgKXKxv
         uV70Sj1yeww1C+H231xGNABGLg7KbiaitfxLNo6qdNf8aeA1TpT/BdlgUXQ1WcM05nQx
         DOiq+sLKCSQl+iEhOip/yM+3E5teYuCOSL6XyN4fabQNuL8FpPeHa8+2kXrtp7yQVTiE
         4bYlEgLJ7hQGEAr9CAEdX6wPTX75rkUlQ5NcutxYK5WPKih3xdcvf1n8GTI//zScMM9H
         0lA6TFk3TnjROjt4R7YLoM9VFPR32WZtFEJ7TcwscNlM540r101O+ongrvxMOKBy7eo8
         tgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753853743; x=1754458543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH3zTOxyYIDrRfVJOd6RDOdJmR7U0O0pjlTQ+4sW4aU=;
        b=rwZMay5DPuuCDsSENrMRGhAgqQBK/h8Pz4oAOEevy+PBZoFoxAMtT98JoI3O6+0LvP
         z0wq+SuT3KIQlb8AWGyjPvMgiAQMuG9qR2R8yiy8sy9baixmxW5Nc1scOhjDjewmmErP
         By1Q5F2NXKrbYj++N+6V9SymAqJwjsYokuuKDQYmczuQ1aXfHXb3W0aJjW5yCVEsWRkc
         ITsGktzceLxNNzcROL2iThZXZUVFzM2avs1OG/xLJbmrciyO+ml3TCvISHykQ/Jk2MI1
         ndiYgg+az9ePTFiHHsAqNxXvnQ1qEFHrDAru/O0VjoRiylIeAHB/glRldH/iNHGC+0Yu
         UCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU/jTvrnAzHawkCSjWhaBEg5FCaU0pRlCFbx9zydNXs+MmvsBF1XXxji/L7t0H6lYZdHIy4EwwjpQwcVqrcwVxFQ3bXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5amnRC4sodEsXpE69WnkMBIUofPlcL2ng+V/yHdcjeWdPSo4o
	BieujtMKh/LvCUdnNVK10nf61Z5Vbo5L3LpLnDs5HQUic2H9L9NpqGGsfEQu4HubiTyNk8QRuCB
	d2C73Jjy3et4JTr89wvy1mawfrhnr77g=
X-Gm-Gg: ASbGncur7/LmIDgHMG7xacglxPmkJhmQjVjr/fd8l9YKwmBttZkCqs43vuL59bCj1cN
	n7MMiYNNK3uOKuYFgv5utiUvqSbeUF87EVaYHt65crIfuMp7V29SGrLRmaLHYdAsFLA6CBB6pag
	CXeej9K9wqd3BbLEK2+9TdxH1g97rb3hQkoqlWZGw0HjVxTjanWxcE8FVRWKKY2GdlPBG8AEZTl
	7bxvzR74q+93WyLhUgiV8fgdjVieA==
X-Google-Smtp-Source: AGHT+IF1A1rFMCZamu2IaBoEgYcv0FlEDEcpi65mFacqaKnSqO4TFFZe9xTcpLnpa+vp2IRUARpC4oiIOFNwGDlLveM=
X-Received: by 2002:a05:687c:2bd3:b0:2ff:89c8:44f4 with SMTP id
 586e51a60fabf-30785aa2ecemr1025319fac.11.1753853743112; Tue, 29 Jul 2025
 22:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com> <2025073013-stimulus-snowdrift-d28c@gregkh>
In-Reply-To: <2025073013-stimulus-snowdrift-d28c@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 30 Jul 2025 11:05:31 +0530
X-Gm-Features: Ac12FXzryDag2xQML-pHPGAPkTO78_sGglQTAMBlXko2uVFjAGeHnUyCAkn37bI
Message-ID: <CAO9wTFihpoVsf-SZYn6yUhCSuN9cBXFGWeGegDsS1QHk4wS7-Q@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	sohil.mehta@intel.com, peterz@infradead.org, ravi.bangoria@amd.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 10:22, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 30, 2025 at 09:56:17AM +0530, Suchit Karunakaran wrote:
> > The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
> > wrong. Since INTEL_P4_PRESCOTT is numerically greater than
> > INTEL_P4_WILLAMETTE, the logic always results in false and never sets
> > X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
> > The error was introduced while replacing the x86_model check with a VFM
> > one. The original check was as follows:
> >         if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> >                 (c->x86 == 0x6 && c->x86_model >= 0x0e))
> >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
>
> What do you mean by "original check"?  Before the change that caused
> this, or what it should be?
>

Original check in this context refers to the change before the erroneous code.

> > Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
> > Cedarmill (model 6) which is the last model released in Family 15.
> >
> > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
> >
> > Cc: <stable@vger.kernel.org> # v6.15
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> Nit, no blank lines beween all of those last lines.  Hint, look at all
> of the patches on the mailing lists AND in the tree already, you have
> hundreds of thousands of examples here of how to format things :)
>

Sorry about it. Should I send a new version of the patch removing the
blank lines?
