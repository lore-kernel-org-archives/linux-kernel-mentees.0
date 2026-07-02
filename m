Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EF3D903B
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990566; cv=none; b=dWNPDbaZlH913fDFXei71efzv76TbMPEC+8zShJrsPVtSRUr+8BrCuVZcGcMzQzfRpikjE4n9V8sdWOIlXTOJtgEn5JhDu3jjM2e/DnosixNTjhNdb45aDRaUSj9wc/8RLfavE+SN8C/qp1IzYBrRlImD9Dqlwb2+Ch5IF8iQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990566; c=relaxed/simple;
	bh=H7+MDSBOZd4JQF5N1xSQnYga2rWSArQZ7jzGQ1exNGg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KrAisc6NHV2MjZH+ZJnkltGTlzlCXwMObNAQ2DmImDsJ/6OZC0nqfyfkhhoKIzrKS78FwUkjS1f+0l7BtK2GYb00wzW58z2SagcreA72nO9ZHB80d6LsZE/XTfffq3jpyRVnnh4HTgsXLRHFTFzG7Qu31cq3R905e3JpWs6Mr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wk0S2VyW; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wk0S2VyW"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso136993266b.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Jul 2026 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782990564; x=1783595364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te4HA4w2tioRKQn5/3FcPTwYWbx1EGaNajEvJ+1ehUQ=;
        b=wk0S2VyWMqDZ9vNKfF0vi3nb1xNtWU9VSFzNj/UsOI4Vb0GlLS77sJJnHSqwZtRTl5
         t0ucDzmkvaKnCMKkfcxXOZcrEN4lovx2oKpJku3cwXeZeqEnJ840y3wXRywB/N65LsRS
         oP4RRBeMDgiTpn2PNwwjXPcy7MEigRXfmAbjLu00+ewmiQuyBKmbelTCgSZgwPhDI8AI
         sUYdneWr+CAv+hCDfpayThnvCH3b9OLA2sNUX6H2EbYhsiM76H4YvJiqvGwAnA6x0Ldu
         y+K71Oq56R+MquLwzwWk2FIfkBFjiKZfzPTPbmrfIil2CjZMRHGJjmgbOSOwOHLGCRcQ
         iVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990564; x=1783595364;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Te4HA4w2tioRKQn5/3FcPTwYWbx1EGaNajEvJ+1ehUQ=;
        b=YzGy2vIvWK79oug1JASEvS51q9nmzbo7Uf7zPMZk0QtsgLWtRDY2tFqKye1FWMbOK1
         NaQ5HQGDf/8VNmOMldEws1yS562VEf1u82borE+8B0XZ1ii6uHGqn22BNOUIOjLeUN5Q
         giKqFeSsr9hVovJ1kI7kSEj0ixpEvzSd/Y37BuQUMxsUTDbL4ZSjylwQk8z9xhZQMXLQ
         +vPAfocBMeG5hwZ8QvmqIiagYGqeEM78kXBc45Qd0olFYiGMkO33mb6zQyEAVrH0v2hF
         fFbnjEt7LKlwUtcvOLmwz8HPe0Xa7dGKaYVgfXTLv1R3BiJq/ix/tDfUMtiMRW1+8h6d
         uCbg==
X-Forwarded-Encrypted: i=1; AHgh+RpoKie74RFe7E7fIs7GjRYNCXVBIKxn33qGhe//kEMvDMT0dc7phc3gyuACl1vThTQrNAMSRGMAH2Qzj/hNRis1FBoUnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGCfpgeFksAwx8JpqhYazsxFU0cv7hj0V8BhoR3Wd/IqjauLJk
	itSDdcJGSmnM7poCtZiuvYur0ipxAY+PtEKIjrNyegn6CpQiTYaJnEbzgKgBXyleZcwZ0Y4XVBJ
	IpxLzmvDrqUKnPJeMbg==
X-Received: from ejyr1.prod.google.com ([2002:a17:906:a201:b0:c12:7b32:c50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:3646:b0:c12:507d:40c3 with SMTP id a640c23a62f3a-c12ae89f339mr226088666b.63.1782990563650;
 Thu, 02 Jul 2026 04:09:23 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:09:22 +0000
In-Reply-To: <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
 <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com> <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Message-ID: <akZG4sDyogS9nBf8@google.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 12:43:25PM -0300, Nicol=C3=A1s Antinori wrote:
> On Sun Jun 28, 2026 at 7:16 AM -03, Miguel Ojeda wrote:
> > On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
> > <nico.antinori.7@gmail.com> wrote:
> >>
> >> -    // SAFETY: All zeroes is safe for the `file_operations` type.
> >> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assu=
me_init() };
> >> +    let zeroed_ops =3D pin_init::zeroed();
> >
> > I would just remove the variable and put `zeroed()` directly in the
> > fops initializer like we do in other cases, but it is fine of course.
>=20
> I thought of that as well but I tried to touch as little as possible (I
> assumed that was in a variable for a reason). I can send a v2 if that is=
=20
> preferred!

I think it was extracted to a variable for line length reasons. You can
remove the variable if you want.

Alice
