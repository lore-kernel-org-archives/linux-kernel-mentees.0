Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B13C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Dec 2021 23:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38967404E3;
	Mon, 13 Dec 2021 23:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YooTSCIfdXN; Mon, 13 Dec 2021 23:09:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BE09F4019D;
	Mon, 13 Dec 2021 23:09:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 965B2C002F;
	Mon, 13 Dec 2021 23:09:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B35EAC0012
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 23:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D7B6812FE
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 23:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=arusty.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vyLBIKv6DFN
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 23:09:45 +0000 (UTC)
X-Greylist: delayed 00:06:33 by SQLgrey-1.8.0
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D206F812F9
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 23:09:44 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4JCcVj4cGSz4wyqf
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 23:03:09 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=arusty.dev header.i=@arusty.dev
 header.b="EaE+AhsL"
Date: Mon, 13 Dec 2021 23:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arusty.dev;
 s=protonmail3; t=1639436578;
 bh=emOmus+00UrMmD/p2owUeqbyivtJMXHFfR+4Uats2fc=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=EaE+AhsLcQmz8QcVyEAiGzxjNFAXxFDixbcy70rk2Nwzh3RHgRRQ24/hvlK0VKdrj
 lACMSDkr8IK+znlQGyLYEO9WpwKIAHcuo7VOlG2hEd1Xxa0jim3fjRiHM/QPr9XFO5
 aS5kH/+y8cOPfzBOkX+OmJcExSDaO5ZriyYkdg/eUCvqkwfqAEqM8hpwo3JYKBgr/T
 /uN4M3hgCtdMlmpdYUzpIiLcRqV1CaLEiQVBFWgxcIj0NukDJlWjshqae03TWD7+0H
 5puzpbc5I3JBCSXaPQK7WHzlFEIFq3d4gYwAHjKexVZcUdA2hN1+BwVatbpngWwKx5
 9aAWJ8Wn7T91A==
To: "linux-kernel-mentees@lists.linux-foundation.org"
 <linux-kernel-mentees@lists.linux-foundation.org>
From: Adam <developer@arusty.dev>
Subject: Kernel Mentee List Possibly compromised? - Following up
Message-ID: <yi_mrbGUoMo62oM_qXAZ1Gr12HMaOVVu5D8gQAiqE243AxgYas1084c-DHApy4nhOdfugYQ5moKrjfWpkO9x-JD2W-gEZa5yYWbsOsLhr3k=@arusty.dev>
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
Reply-To: Adam <developer@arusty.dev>
Content-Type: multipart/mixed; boundary="===============3967236946317135802=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3967236946317135802==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------5273b9a5a45df1ae90c2f205de18e22ba92a41761e753d5703ca159c9a9a3b9e"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------5273b9a5a45df1ae90c2f205de18e22ba92a41761e753d5703ca159c9a9a3b9e
Content-Type: multipart/mixed;boundary=---------------------dc8bc2e7b2542fe3447757078536085d

-----------------------dc8bc2e7b2542fe3447757078536085d
Content-Type: multipart/alternative;boundary=---------------------3ead46385240ad73ffb39883650643e5

-----------------------3ead46385240ad73ffb39883650643e5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hey again everyone,

So after taking a deeper look, I can say with reasonable confidence that t=
his is a malicious attempt. It doesn't seem to have downloaded anything, m=
alicious, however it is very possible that it is just employing IP based a=
nti-forensics techniques.

Judging just from the IP connections it made, its likely part of an email =
based credential theft phishing campaign.

So as I suggested in the previous email, DO NOT CLICK THE LINK. Also, if y=
ou would, please flag the email as a phishing email. This will help to shu=
tdown part of their campaign.

Respectfully,

Adam Smith

Sent with ProtonMail Secure Email.

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original M=
essage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Monday, December 13th, 2021 at 4:29 PM, RedGrinGrumbler <adam.smith@aru=
sty.dev> wrote:

> Hi All,
> =


> I just received a funny email from "<example>@mruiqnu.cn"
> =


> The email was an "account info changed" email, however it was for a comm=
ercial site and was addressed to the entire community. If you received thi=
s email, DO NOT CLICK THE LINK.
> =


> I haven't actually tried sand-boxing this yet, but my guess is that it w=
ill either send you to a drive-by malware site or try and get you to divul=
ge your credentials.
> =


> That about summarizes everything, just wanted to let everyone else know =
that something fishy is going on.
> =


> Adam Smith
> GCIH, GSEC, CySA+, Sec+
> GIAC Advisory Board Member
> Sent with ProtonMail Secure Email.
-----------------------3ead46385240ad73ffb39883650643e5
Content-Type: multipart/related;boundary=---------------------88b8536c2ecfaea42bae7a270c112fac

-----------------------88b8536c2ecfaea42bae7a270c112fac
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IZXkgYWdhaW4gZXZlcnlvbmUsIDxicj48YnI+U28gYWZ0ZXIgdGFraW5nIGEgZGVlcGVy
IGxvb2ssIEkgY2FuIHNheSB3aXRoIHJlYXNvbmFibGUgY29uZmlkZW5jZSB0aGF0IHRoaXMgaXMg
YSBtYWxpY2lvdXMgYXR0ZW1wdC4gSXQgZG9lc24ndCBzZWVtIHRvIGhhdmUgZG93bmxvYWRlZCBh
bnl0aGluZywgbWFsaWNpb3VzLCBob3dldmVyIGl0IGlzIHZlcnkgcG9zc2libGUgdGhhdCBpdCBp
cyBqdXN0IGVtcGxveWluZyBJUCBiYXNlZCBhbnRpLWZvcmVuc2ljcyB0ZWNobmlxdWVzLiA8YnI+
PGJyPkp1ZGdpbmcganVzdCBmcm9tIHRoZSBJUCBjb25uZWN0aW9ucyBpdCBtYWRlLCBpdHMgbGlr
ZWx5IHBhcnQgb2YgYW4gZW1haWwgYmFzZWQgY3JlZGVudGlhbCB0aGVmdCBwaGlzaGluZyBjYW1w
YWlnbi4gPGJyPjxicj5TbyBhcyBJIHN1Z2dlc3RlZCBpbiB0aGUgcHJldmlvdXMgZW1haWwsIERP
IE5PVCBDTElDSyBUSEUgTElOSy4gQWxzbywgaWYgeW91IHdvdWxkLCBwbGVhc2UgZmxhZyB0aGUg
ZW1haWwgYXMgYSBwaGlzaGluZyBlbWFpbC4gVGhpcyB3aWxsIGhlbHAgdG8gc2h1dGRvd24gcGFy
dCBvZiB0aGVpciBjYW1wYWlnbi48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2siPjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0
dXJlX2Jsb2NrLXVzZXIiPjxkaXY+UmVzcGVjdGZ1bGx5LDxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFkYW0gU21pdGg8YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stcHJvdG9uIj5TZW50
IHdpdGggPGEgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiBocmVmPSJodHRwczovL3Byb3Rvbm1h
aWwuY29tLyIgdGFyZ2V0PSJfYmxhbmsiPlByb3Rvbk1haWw8L2E+IFNlY3VyZSBFbWFpbC48L2Rp
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIj4KICAg
ICAgICDigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDi
gJDigJDigJA8YnI+CiAgICAgICAgT24gTW9uZGF5LCBEZWNlbWJlciAxM3RoLCAyMDIxIGF0IDQ6
MjkgUE0sIFJlZEdyaW5HcnVtYmxlciAmbHQ7YWRhbS5zbWl0aEBhcnVzdHkuZGV2Jmd0OyB3cm90
ZTo8YnI+CiAgICAgICAgPGJsb2NrcXVvdGUgY2xhc3M9InByb3Rvbm1haWxfcXVvdGUiIHR5cGU9
ImNpdGUiPgogICAgICAgICAgICA8ZGl2PjxkaXY+SGkgQWxsLCA8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5JIGp1c3QgcmVjZWl2ZWQgYSBmdW5ueSBlbWFpbCBmcm9tIDxzcGFuPjxzcGFu
IGRhdGEtdGVzdGlkPSJtZXNzYWdlLWhlYWRlcjpmcm9tIj48c3Bhbj48c3BhbiB0aXRsZT0iQW1h
em9uLmNvLmpwIDxzdXBwb3J0LWFtYXpvbi5qcEBtcnVpcW51LmNuPiI+PHNwYW4+IiZsdDtleGFt
cGxlJmd0OzxhIGhyZWY9Im1haWx0bzpzdXBwb3J0LWFtYXpvbi5qcEBtcnVpcW51LmNuIiByZWw9
Im5vcmVmZXJyZXIgbm9mb2xsb3cgbm9vcGVuZXIiIHRhcmdldD0iX2JsYW5rIj5AbXJ1aXFudS5j
bjwvYT4iIDxicj5UaGUgZW1haWwgd2FzIGFuICJhY2NvdW50IGluZm8gY2hhbmdlZCIgZW1haWws
IGhvd2V2ZXIgaXQgd2FzIGZvciBhIGNvbW1lcmNpYWwgc2l0ZSBhbmQgd2FzIGFkZHJlc3NlZCB0
byB0aGUgZW50aXJlIGNvbW11bml0eS4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZW1haWwsIERPIE5P
VCBDTElDSyBUSEUgTElOSy4gPGJyPkkgaGF2ZW4ndCBhY3R1YWxseSB0cmllZCBzYW5kLWJveGlu
ZyB0aGlzIHlldCwgYnV0IG15IGd1ZXNzIGlzIHRoYXQgaXQgd2lsbCBlaXRoZXIgc2VuZCB5b3Ug
dG8gYSBkcml2ZS1ieSBtYWx3YXJlIHNpdGUgb3IgdHJ5IGFuZCBnZXQgeW91IHRvIGRpdnVsZ2Ug
eW91ciBjcmVkZW50aWFscy4gPGJyPjxicj5UaGF0IGFib3V0IHN1bW1hcml6ZXMgZXZlcnl0aGlu
ZywganVzdCB3YW50ZWQgdG8gbGV0IGV2ZXJ5b25lIGVsc2Uga25vdyB0aGF0IHNvbWV0aGluZyBm
aXNoeSBpcyBnb2luZyBvbi4gPGJyPjwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvc3Bhbj48L3NwYW4+
PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1
cmVfYmxvY2siPjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIiPjxk
aXY+QWRhbSBTbWl0aDxicj48L2Rpdj48ZGl2PkdDSUgsIEdTRUMsIEN5U0ErLCBTZWMrPGJyPjwv
ZGl2PjxkaXY+R0lBQyBBZHZpc29yeSBCb2FyZCBNZW1iZXI8YnI+PC9kaXY+PC9kaXY+PGRpdiBj
bGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stcHJvdG9uIj5TZW50IHdpdGggPGEgcmVs
PSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiBocmVmPSJodHRwczovL3Byb3Rvbm1haWwu
Y29tLyIgdGFyZ2V0PSJfYmxhbmsiPlByb3Rvbk1haWw8L2E+IFNlY3VyZSBFbWFpbC48L2Rpdj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj4KICAgICAgICA8L2Jsb2NrcXVvdGU+PGJyPgogICAgPC9kaXY+
-----------------------88b8536c2ecfaea42bae7a270c112fac--
-----------------------3ead46385240ad73ffb39883650643e5--
-----------------------dc8bc2e7b2542fe3447757078536085d
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
-----------------------dc8bc2e7b2542fe3447757078536085d
Content-Type: application/pgp-signature; filename="signature.asc"; name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"; name="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogUHJvdG9uTWFpbAoKd25VRUFS
WUtBQVlGQW1HM3lUQUFJUWtRRkZEVDE3enZ3ckFXSVFRaTZITWpRTHkzKzJxdXc3OFVVTlBYCnZP
L0NzRVB1QVFETHpSZW1Temcxa0U1SUpUcG93M0FndURqbE90U2cwVnRTTzRYSXE0Y0RyUUQvY21K
egoxaTgrT3dURWM3RUwzNFF3ajFVbUJsY0s5VmljWUVBZmh6ajE2UUE9Cj1DbmxrCi0tLS0tRU5E
IFBHUCBTSUdOQVRVUkUtLS0tLQo=
-----------------------dc8bc2e7b2542fe3447757078536085d
Content-Type: application/pgp-keys; filename="publickey - developer@arusty.dev - 0xEC59D0E9.asc"; name="publickey - developer@arusty.dev - 0xEC59D0E9.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - developer@arusty.dev - 0xEC59D0E9.asc"; name="publickey - developer@arusty.dev - 0xEC59D0E9.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQpWZXJzaW9uOiBPcGVuUEdQLmpz
IHY0LjEwLjEwDQpDb21tZW50OiBodHRwczovL29wZW5wZ3Bqcy5vcmcNCg0KeGpNRVgyVkJIQllK
S3dZQkJBSGFSdzhCQVFkQTYwTWZTNEo3VWRudUtsUWpxb1lKYkI0eS9aVUN0allkDQo5c2EzM2lk
NkNUak5LMlJsZG1Wc2IzQmxja0JoY25WemRIa3VaR1YySUR4a1pYWmxiRzl3WlhKQVlYSjENCmMz
UjVMbVJsZGo3Q2p3UVFGZ29BSUFVQ1gyVkJIQVlMQ1FjSUF3SUVGUWdLQWdRV0FnRUFBaGtCQWhz
RA0KQWg0QkFDRUpFQzR6QnF2ZVN1UFNGaUVFN0ZuUTZjYjNxOURJakx5cExqTUdxOTVLNDlJSUNB
RDhEWFY1DQpkaWpiZHFYNHJiZEZFQ2VFTzJJTENEN3E1RmppM1h1QW4xVG4yM01CQUk4bDBEVU5H
VDVhbVdZMTNrcmsNCm5Sei85Zm1zYTEvR1FUWDNqZWR3UmV3RHpqZ0VYMlZCSEJJS0t3WUJCQUdY
VlFFRkFRRUhRSU9xanlOaQ0KU0hDT0RLR0JwUFlrbm15TmZNelZPVkFUQkFBZktOcUtMdTRMQXdF
SUI4SjRCQmdXQ0FBSkJRSmZaVUVjDQpBaHNNQUNFSkVDNHpCcXZlU3VQU0ZpRUU3Rm5RNmNiM3E5
RElqTHlwTGpNR3E5NUs0OUxpemdFQTlqRGQNCjMzTjRacWxLbGltdzVvSEkvZjJzNm5xTlRYdVpn
WTkzWEZHQm5wTUJBUElrTk1Ra01jL3gxOXZ5ZDVjVQ0KVmdscmtKbkN3Z3JpMnNpeWJoV1B4c29C
DQo9NENGOA0KLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ0K
-----------------------dc8bc2e7b2542fe3447757078536085d--

--------5273b9a5a45df1ae90c2f205de18e22ba92a41761e753d5703ca159c9a9a3b9e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmG30RAAIQkQLjMGq95K49IWIQTsWdDpxver0MiMvKkuMwar
3krj0k+hAPkAB3grTUdtxOC0FLZl7qIYqEuRCFRNxcVhqeJikMSlDAD9GMlg
rP8y1sVMgPXOXyf1bgfn2TIjCq1HwFOnJ9/e7gQ=
=/LF7
-----END PGP SIGNATURE-----


--------5273b9a5a45df1ae90c2f205de18e22ba92a41761e753d5703ca159c9a9a3b9e--


--===============3967236946317135802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3967236946317135802==--

