Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91735976
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959227; cv=none; b=jJb8+ZwyTRb2GKWq0E4019yjuYXFWM918ZOR4ybBn4eWtvVwbTWcHJ7RbA6ZvmSUBTKGls+gmuho54zUJsVKG0B773gcs3ZSCuinE+STwDJ0o79pUVlTPWYwl7HJOY0SN736Kj9zDjPO5XmzfzUSUl4GxRZtxR1izgYqJTZMF3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959227; c=relaxed/simple;
	bh=rst0/M9sDykPTp06oKAZBNlgwDpIbTMSzfWhSKgBtbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFIqdc+5vxMWWAHZJdE1Z3A43VBaFiqnCvPdpM5tzR/01MzKjrMT+RYKMOi5QzQirYeFtFkDIbbEpNr2UnKM85eADC3XmBs8Wh8IJxulFChK36H4LXkf0QOTsthx25QhkZlr/BZhD5AjtcymQLluJxmLDH4MnTKJfOz9CSz/HxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKate4PW; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKate4PW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC5D81EBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 00:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXD7bP6iIRI2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 May 2025 00:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 896F9814DB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 896F9814DB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UKate4PW
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 896F9814DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 00:13:43 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2d0920ce388so3459694fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 May 2025 17:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747959222; x=1748564022; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVsgWhpRYvtdlITuRBXbwTjOq8o/UaeIMccIM0WPVe8=;
        b=UKate4PWAaYEqbv4+AceXvZdWU3dxjyZIJqkeIUovw4Hi3tBctQubdRrx+p3XsvRi4
         wkIb2ZsL0CEtwmkvgAVIj47yNg98RupUnpHtAv2lPmF1QH+rNzWXYTaq4PoEoQFTaQZT
         LypKzR7gyjqI7PwCq/TthonXsvmVslm9fp4bYLX2EeHg8pwNbF5Yjk3p72TK7NLpGYSZ
         yl9m0bCyPSiD6Swr3F1P0x3vggPrPwHsQ4Y10mo42RpxVfmuoYTSCklDrUiyab6bIAPy
         CyxU8w8nh9SznqFG7S4zCkoro0X67WF6UchSuriYYE5WPyknOVDPjVNIvGYTJW1FwyFh
         nHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959222; x=1748564022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVsgWhpRYvtdlITuRBXbwTjOq8o/UaeIMccIM0WPVe8=;
        b=KR4RK6h75RdutSle6z1FanGOJ8x8grAE3YJQCzyFmhRaXTufwSxXkOgoYulz2TAcf0
         1lTKjgf/Xro7rHfS96Ns1v3J0IY88PYqQPcfdFOpFch/YyA3pcR9DFQUV/gwcQhUCa3X
         5w4xjIA3GO3C44UPgJWA86wqcEQlg23yiN96sNRmiG6cHanS2HC2qP1pnDMkJwWde+p4
         2tE4PU+LLDPdk7WXTHHMO6lb1XnEWlmWJcWKSBuS9ZD6e746Rn/8+eSeZKsw2fCyNOlu
         NkD7/Q16l/dcARxgpVjmmVHcgSQbe80t2T4cavivaQD85vAVl9CiM42MMzfhZTfPHBpE
         sMLw==
X-Forwarded-Encrypted: i=1; AJvYcCWwJW0HA/BXbLoS+Yy8YPSSoTRI7OEpLJWnLynZ3UpzjwL7ZjnKIRSzVhPJ1Lmymi2nmHDV2kjf9wPudE5L34xkPQ2y+A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx7REivIgtR4ZgydJc0XGRtCUIXQ3u4JlBx3MHC3W/GXQ7tT2/V
	21NavFz4JXL6Pv3C4XoerfSQPLGe/d4fxo2AFEiRuei7Co9E9umOVYE1PRac3ZMKGtfJzFJnrxI
	KxF3K2AxhOzP0PP5QVUQkvsr65G3R/Lo=
X-Gm-Gg: ASbGncsi5J14/HzNjb4GFpiM8nxH8dHpoHP9FL+RhOzrbYajd6HxttmECjPxzLfYgNY
	kgGysuOOgaMh4rCuA301AsELmWz7Jihc1QohG2dSqWuSKYpMBZjX6Lbzdw23X5A1b4TByyPJOEh
	DNYo76l0n7zj3CX5CpO5CrlKZmFTntEztZHZv9LuTmz+qM
X-Google-Smtp-Source: AGHT+IGd55b0sZSomD/WG3O3kWu4Oa2dyLscoAQxoAT6h3OTeJAtRaokwX6kXpuxFqFKtuMVrqLbOc3TGlRvoTR67Hk=
X-Received: by 2002:a05:6870:6191:b0:2c2:3e54:553 with SMTP id
 586e51a60fabf-2e3c1ed25d4mr16851015fac.28.1747959222083; Thu, 22 May 2025
 17:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux> <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
In-Reply-To: <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 22 May 2025 21:13:30 -0300
X-Gm-Features: AX0GCFs6CiOuXbALz3PSzIn221oJ7SuLny8l_W7DaxSPxO6clQIFyTIrNFWSd1M
Message-ID: <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, benno.lossin@proton.me, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the discussions. I was reading them one by one and
trying to consolidate the ideas.
I am preparing a new patch version focused on improving everything
that was discussed.

Before submitting the patch, I would like to understand if things are
clear to me. Here is what I am preparing:

1. Refined `Revocable<T>` Invariants, suggested by Benno:
Proposed Documentation:
/// # Invariants
///
/// - `data` is valid for reads in two cases:
/// - while `is_available` is true, or
/// - while the RCU read-side lock is taken and it was acquired while
`is_available` was `true`.
/// - `data` is valid for writes when `is_available` was atomically
changed from `true` to `false`.


 2. Updated try_access and try_access_with_guard Safety Comments:
Proposed Documentation:
// INVARIANT: `self.data` is valid for reads because
`self.is_available` is true,
// and the RCU read-side lock ensures this condition is maintained
during access.

These comments now directly reference the new Revocable<T> read invariants.
This addresses the  point about justifying the access to data via the
invariants,
especially considering the RCU read-side lock.


3. Clarified revoke_internal for SYNC =3D false and swap correction
Proposed Documentation:
 if self.is_available.swap(false, Ordering::Relaxed) {
 if SYNC {
                // SAFETY: Just an FFI call, there are no further requireme=
nts.
                unsafe { bindings::synchronize_rcu() };
 }  else {
       // This branch for `revoke_nosync` requires the caller to prove
that `data`
       // can be dropped immediately without waiting for any RCU grace peri=
od.
}
// SAFETY: We know `self.data` is valid because only one CPU can succeed th=
e
// `swap` above that takes `is_available` from `true` to `false`.
 unsafe { drop_in_place(self.data.get()) };
   }
}

I've added a  comment for the SYNC =3D false branch (used by revoke_nosync)=
.
This explicit else block, even if semantically empty of executable code, is=
 for
documenting the unsafe contract for revoke_nosync(). It  states that the ca=
ller
must prove data safety since no RCU grace period is awaited, aligning with
Danilo's explanation of revoke_nosync's purpose. Additionally, I've correct=
ed
the comment from compare_exchange to swap to accurately reflect the
atomic operation used.


4. Documented RevocableGuard<'_, T> Invariants and PhantomData Adjustment
Proposed Documentation:
/// # Invariants
///
/// - The RCU read-side lock is held for the lifetime of this guard.
/// - `data_ref` points to valid data for the lifetime of this guard.
pub struct RevocableGuard<'a, T> {
    data_ref: *const T,
    _rcu_guard: rcu::Guard,
    _p: PhantomData<&'a T>,
}

This adds the # Invariants section for RevocableGuard, as we agreed it shou=
ld
state its guarantees, including the RCU read-side lock. The adjustment of
_p: PhantomData<&'a ()> to _p: PhantomData<&'a T> is a minor improvement in
type-level documentation, making the lifetime dependency more explicit to t=
he
Rust compiler and future readers.


5. Revised RevocableGuard Deref Safety Comment
Proposed Documentation:
fn deref(&self) -> &Self::Target {
        // SAFETY: By the invariants of `RevocableGuard`, the RCU
read-side lock is held,
        // and `data_ref` points to valid data for the lifetime of this gua=
rd.
        unsafe { &*self.data_ref }
    }

The // SAFETY: comment for Deref is updated to refer to the RevocableGuard'=
s new
invariants, providing a justification for the unsafe dereference.


6. PinnedDrop for Revocable<T> Safety Documentation & Readability
Proposed Documentation:
let p =3D unsafe { self.get_unchecked_mut() };
        if *p.is_available.get_mut() {
            // INVARIANT: `is_available` is true, so `data` is valid for re=
ads.
            // SAFETY: `self.data` is valid for writes because
`is_available` was atomically changed from true to false
            // in `PinnedDrop::drop`, and only one thread can do it
now as we have `&mut self`.
            // This ensures `data` is valid for writes in this
context, allowing `drop_in_place`.
            unsafe { drop_in_place(p.data.get()) };
        }

The // INVARIANT: and // SAFETY: comments within the PinnedDrop
implementation are
updated to reflect the new write invariant of Revocable<T>, justifying
the drop_in_place call.


Please let me know if something is wrong or unnecessary... I'll try to
rephrase if appropriate. Tks :D

---
Cheers,
Marcelo Moreira :-)


Em seg., 19 de mai. de 2025 =C3=A0s 09:26, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon May 19, 2025 at 1:37 PM CEST, Danilo Krummrich wrote:
> > On Mon, May 19, 2025 at 01:10:32PM +0200, Benno Lossin wrote:
> >> On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> >> > On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
> >> > Why not? Please show me a case where `is_available` is false, but I =
can still
> >> > technically access data (without violating a safety requirement).
> >>
> >>     let r: Arc<Revocable<i32>> =3D ...;
> >>     let guard =3D r.try_access().unwrap(); // nobody else is holding a=
 reference, so this can't fail
> >>
> >>     let r2 =3D r.clone();
> >>
> >>     // I know we don't have threads, but I don't want to have to look =
up
> >>     // how to use the workqueue or something else...
> >>     thread::spawn(move || {
> >>         r2.revoke();
> >>     });
> >>
> >>     for _ in 0..10_000_000 {
> >>         // do some non-sleeping work that takes a while
> >>     }
> >>
> >>     // now the thread above has executed `self.is_available.swap(false=
, Ordering::Relaxed)`
> >>     // in `revoke_internal` and is waiting for the `synchronize_rcu` c=
all to return.
> >>     // but we can still access `guard`:
> >>
> >>     pr_info!("{}", &*guard);
> >
> > Which is perfectly correct, you're right. I think I was too focused on =
the
> > optimization case. :-)
>
> And I was assuming the example was obvious with just saying "But the
> `is_available` atomic *can* be altered during the usage of `data`." :-)
>
> >> > However, this invariant does not need to be fulfilled for access() a=
nd
> >>
> >> Where is `access()` defined?
> >
> > https://gitlab.freedesktop.org/drm/nova/-/commit/46f91addfabbd4109fb648=
76a032ae4a4a924919
>
> "Reviewed-by: Benno Lossin <benno.lossin@proton.me>" huh, I already
> forgot about the patch... But that also shouldn't be difficult to
> support with the right invariant.
>
> >> > revoke_nosync(), because it would circumvent their purpose, i.e. cas=
es where an
> >> > abstraction can prove that there can't be a concurrent user of the d=
ata or a
> >> > concurrent user revoking the data respectively.
> >>
> >> Yes. How about something like "`data` is valid while `is_available` is
> >> true. It also is valid if the RCU read-side lock is being held and it
> >> was taken while `is_available` was true."?
> >>
> >> That should also cover the "nobody else is accessing this" case.
> >
> > Sounds good to me!
>
> I'm not happy with the sentence structure, so how about:
>
> * `data` is valid for reads in two cases:
>     * while `is_available` is true, or
>     * while the RCU read-side lock is taken and it was acquired while `is=
_available` was `true`.
> * `data` is valid for writes when `is_available` was atomically changed f=
rom `true` to `false`.
>
> The last one is needed in order to call `drop_in_place`.
>
> ---
> Cheers,
> Benno
