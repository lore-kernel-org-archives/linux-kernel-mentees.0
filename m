Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB7BC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Dec 2021 22:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C378D4054A;
	Mon, 13 Dec 2021 22:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2Fdhd82-_42; Mon, 13 Dec 2021 22:39:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0BC4E40207;
	Mon, 13 Dec 2021 22:39:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCA63C002F;
	Mon, 13 Dec 2021 22:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17563C0012
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 22:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E944054A
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 22:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVU0WOEdVehD
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 22:39:10 +0000 (UTC)
X-Greylist: delayed 00:09:37 by SQLgrey-1.8.0
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3404E40207
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 22:39:09 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4JCblv33mLz4wwvj
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 22:29:31 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=arusty.dev header.i=@arusty.dev
 header.b="Y4y6Axrd"
Date: Mon, 13 Dec 2021 22:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arusty.dev;
 s=protonmail3; t=1639434560;
 bh=zl43ywkrxTDGxBCDGPEV+Z3jhva3rTAzXPnDzRYeh40=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=Y4y6AxrdwnT2rtvGHaF+W52uxXwaDECoC0c/wcjTfa/bXuR/cApGk/Cu403gu4H+2
 X/Xv0NGOUoFv90jsgfJv3Yxpc+oPbXgCKvkssSy4iDBbdxsIwWuGnQi0MNEESdW0gA
 2Fjr63WyHAtA8abS2KA+Dj3a+3I9tNGsmCMro/o5wFLmNxjPEMHvuYsqBOcKK/QFAY
 39vIjPK9P2EgvwXF2uAon/v+ARF3L5pgUoKi4VNQnezQ7QiXgGt+e8GITwoaJf2vTW
 xs7nxS4R5ObRYokmj6dbi6t2XM5GC9mgxj5vw8D1a1TYY5IPAKgypFUcowmAsrYF1s
 b8wWTnMDkZ9rQ==
To: "linux-kernel-mentees@lists.linux-foundation.org"
 <linux-kernel-mentees@lists.linux-foundation.org>
From: RedGrinGrumbler <adam.smith@arusty.dev>
Subject: Kernel Mentee List Possibly compromised?
Message-ID: <q7FpqXXlrDuo7GFi5lXwIEZ5gQIR3Bii0Uw7HoZ3cidLSnfpupNYwrjXcjm2f1ysH_DpxIA5U1aJ9wa8_zATl-Nkfn2Ve6adjTBHHv3P1jc=@arusty.dev>
MIME-Version: 1.0
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Reply-To: RedGrinGrumbler <adam.smith@arusty.dev>
Content-Type: multipart/mixed; boundary="===============3190810573422340232=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3190810573422340232==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------4b625758a46dbd054c8116d0de44341956bceb26083cd647eac793be5ea6c550"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------4b625758a46dbd054c8116d0de44341956bceb26083cd647eac793be5ea6c550
Content-Type: multipart/mixed;boundary=---------------------85ef4e4cb7b7127a3b730e7df106ddc4

-----------------------85ef4e4cb7b7127a3b730e7df106ddc4
Content-Type: multipart/alternative;boundary=---------------------83dc2267201b6d5df3ac6a8409d9fb28

-----------------------83dc2267201b6d5df3ac6a8409d9fb28
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi All,

I just received a funny email from "<example>@mruiqnu.cn"

The email was an "account info changed" email, however it was for a commer=
cial site and was addressed to the entire community. If you received this =
email, DO NOT CLICK THE LINK.

I haven't actually tried sand-boxing this yet, but my guess is that it wil=
l either send you to a drive-by malware site or try and get you to divulge=
 your credentials.

That about summarizes everything, just wanted to let everyone else know th=
at something fishy is going on.

Adam Smith
GCIH, GSEC, CySA+, Sec+
GIAC Advisory Board Member
Sent with ProtonMail Secure Email.
-----------------------83dc2267201b6d5df3ac6a8409d9fb28
Content-Type: multipart/related;boundary=---------------------bb0ba70f5519ce3f6de2f015c0221b28

-----------------------bb0ba70f5519ce3f6de2f015c0221b28
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PkhpIEFsbCwgPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBqdXN0IHJl
Y2VpdmVkIGEgZnVubnkgZW1haWwgZnJvbSA8c3BhbiBjbGFzcz0iZmxleCBmbGV4LWl0ZW0tZmx1
aWQgZmxleC1ub3dyYXAgbXIwLTUiPjxzcGFuIGRhdGEtdGVzdGlkPSJtZXNzYWdlLWhlYWRlcjpm
cm9tIiBjbGFzcz0iZmxleCBmbGV4LWFsaWduLWl0ZW1zLWNlbnRlciBmbGV4LW5vd3JhcCBtZXNz
YWdlLXJlY2lwaWVudC1pdGVtIj48c3BhbiBjbGFzcz0iZmxleCBmbGV4LWFsaWduLWl0ZW1zLWNl
bnRlciBmbGV4LW5vd3JhcCB0ZXh0LWVsbGlwc2lzIG1heC13MTAwIj48c3BhbiB0aXRsZT0iQW1h
em9uLmNvLmpwIDxzdXBwb3J0LWFtYXpvbi5qcEBtcnVpcW51LmNuPiIgY2xhc3M9ImZsZXgtaXRl
bS1mbHVpZCBtZXNzYWdlLXJlY2lwaWVudC1pdGVtLWxhYmVsLWFkZHJlc3MgdGV4dC1lbGxpcHNp
cyBtYXgtdzEwMCBpbmxpbmUtYmxvY2siPjxzcGFuIGNsYXNzPSJtZXNzYWdlLXJlY2lwaWVudC1p
dGVtLWFkZHJlc3MgY29sb3Itd2VhayI+IiZsdDtleGFtcGxlJmd0OzxhIGhyZWY9Im1haWx0bzpz
dXBwb3J0LWFtYXpvbi5qcEBtcnVpcW51LmNuIj5AbXJ1aXFudS5jbjwvYT4iIDxicj5UaGUgZW1h
aWwgd2FzIGFuICJhY2NvdW50IGluZm8gY2hhbmdlZCIgZW1haWwsIGhvd2V2ZXIgaXQgd2FzIGZv
ciBhIGNvbW1lcmNpYWwgc2l0ZSBhbmQgd2FzIGFkZHJlc3NlZCB0byB0aGUgZW50aXJlIGNvbW11
bml0eS4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZW1haWwsIERPIE5PVCBDTElDSyBUSEUgTElOSy4g
PGJyPkkgaGF2ZW4ndCBhY3R1YWxseSB0cmllZCBzYW5kLWJveGluZyB0aGlzIHlldCwgYnV0IG15
IGd1ZXNzIGlzIHRoYXQgaXQgd2lsbCBlaXRoZXIgc2VuZCB5b3UgdG8gYSBkcml2ZS1ieSBtYWx3
YXJlIHNpdGUgb3IgdHJ5IGFuZCBnZXQgeW91IHRvIGRpdnVsZ2UgeW91ciBjcmVkZW50aWFscy4g
PGJyPjxicj5UaGF0IGFib3V0IHN1bW1hcml6ZXMgZXZlcnl0aGluZywganVzdCB3YW50ZWQgdG8g
bGV0IGV2ZXJ5b25lIGVsc2Uga25vdyB0aGF0IHNvbWV0aGluZyBmaXNoeSBpcyBnb2luZyBvbi4g
PGJyPjwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvc3Bhbj48L3NwYW4+PC9kaXY+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2siPjxkaXYgY2xh
c3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIiPjxkaXY+QWRhbSBTbWl0aDxicj48
L2Rpdj48ZGl2PkdDSUgsIEdTRUMsIEN5U0ErLCBTZWMrPGJyPjwvZGl2PjxkaXY+R0lBQyBBZHZp
c29yeSBCb2FyZCBNZW1iZXI8YnI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9z
aWduYXR1cmVfYmxvY2stcHJvdG9uIj5TZW50IHdpdGggPGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9
Imh0dHBzOi8vcHJvdG9ubWFpbC5jb20vIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPlByb3Rv
bk1haWw8L2E+IFNlY3VyZSBFbWFpbC48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4=
-----------------------bb0ba70f5519ce3f6de2f015c0221b28--
-----------------------83dc2267201b6d5df3ac6a8409d9fb28--
-----------------------85ef4e4cb7b7127a3b730e7df106ddc4
Content-Type: application/pgp-keys; filename="publickey - adam.smith@arusty.dev - 0x22E87323.asc"; name="publickey - adam.smith@arusty.dev - 0x22E87323.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - adam.smith@arusty.dev - 0x22E87323.asc"; name="publickey - adam.smith@arusty.dev - 0x22E87323.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQpWZXJzaW9uOiBPcGVuUEdQLmpz
IHY0LjEwLjEwDQpDb21tZW50OiBodHRwczovL29wZW5wZ3Bqcy5vcmcNCg0KeGpNRVgyVXlDQllK
S3dZQkJBSGFSdzhCQVFkQUN4WXB3SzYxR3p6K1EyYzZSMWFYa25sakQ1RVA3ZEhFDQp1U21HeDAz
bk5KUE5MV0ZrWVcwdWMyMXBkR2hBWVhKMWMzUjVMbVJsZGlBOFlXUmhiUzV6YldsMGFFQmgNCmNu
VnpkSGt1WkdWMlBzS1BCQkFXQ2dBZ0JRSmZaVElJQmdzSkJ3Z0RBZ1FWQ0FvQ0JCWUNBUUFDR1FF
Qw0KR3dNQ0hnRUFJUWtRRkZEVDE3enZ3ckFXSVFRaTZITWpRTHkzKzJxdXc3OFVVTlBYdk8vQ3NC
b09BUURODQpXR3k4TlBOSVhDcjI3eGNSWExEbEUwL1I0akRTS2RmNlkwQ1VSZkM1NWdEL2JpM3R3
UVJnODVNQmgyREYNCjZHUUJmQkVpOXArZDFEak82UzViUWpUUjNRak9PQVJmWlRJSUVnb3JCZ0VF
QVpkVkFRVUJBUWRBbERnNg0KczdvRnpOZHRMVFUyR1pjMEN2bS81YzNGTkhaY0ZYdEdiZ3k0ZndF
REFRZ0h3bmdFR0JZSUFBa0ZBbDlsDQpNZ2dDR3d3QUlRa1FGRkRUMTd6dndyQVdJUVFpNkhNalFM
eTMrMnF1dzc4VVVOUFh2Ty9Dc0p1L0FQNHUNCkhKUHluOWJjTVhpR0hpVGJOMHlaa09Id1NUQzhk
K00zNC8xWUZwcVhpZ0VBNU43VzhOdE9INUpicWxVQw0KY3hMdTJTUTJJTkVkdGhmV3NZanBzRERC
U2dNPQ0KPVZXVmYNCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0NCg==
-----------------------85ef4e4cb7b7127a3b730e7df106ddc4--

--------4b625758a46dbd054c8116d0de44341956bceb26083cd647eac793be5ea6c550
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmG3yTAAIQkQFFDT17zvwrAWIQQi6HMjQLy3+2quw78UUNPX
vO/CsEPuAQDLzRemSzg1kE5IJTpow3AguDjlOtSg0VtSO4XIq4cDrQD/cmJz
1i8+OwTEc7EL34Qwj1UmBlcK9VicYEAfhzj16QA=
=Cnlk
-----END PGP SIGNATURE-----


--------4b625758a46dbd054c8116d0de44341956bceb26083cd647eac793be5ea6c550--


--===============3190810573422340232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3190810573422340232==--

