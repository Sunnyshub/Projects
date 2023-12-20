import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { GUI } from 'dat.gui'

console.log(THREE)

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );
const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
const camera2 = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 0.1, 1000 );
const controls = new OrbitControls( camera, renderer.domElement );
const directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 );
scene.add( directionalLight );

directionalLight.position.z = 5;

const geometry = new THREE.BoxGeometry( 1, 1, 1 );
const material = new THREE.MeshStandardMaterial( { color: 0x00ff00 } );
const cube = new THREE.Mesh( geometry, material );
scene.add( cube );


const light = new THREE.AmbientLight( 0x999999 ); // soft white light
scene.add( light );


camera.position.z = 5;
camera.position.y = 2;
camera.position.x = 2;

camera2.position.z = 4;
camera2.position.y = 1;
camera2.position.x = -1;

const gui = new GUI()
const cubeFolder = gui.addFolder('Cube')
cubeFolder.add(cube.rotation, 'x', 0, Math.PI * 2)
cubeFolder.add(cube.rotation, 'y', 0, Math.PI * 2)
cubeFolder.add(cube.rotation, 'z', 0, Math.PI * 2)
cubeFolder.open()
const cameraFolder = gui.addFolder('Camera')
cameraFolder.add(camera.position, 'x', -50, 50)
cameraFolder.add(camera.position, 'y', -50, 50)
cameraFolder.add(camera.position, 'z', -50, 50)

cameraFolder.open()

function animate () {
    requestAnimationFrame( animate );
    cube.rotation.y+= 300;
    renderer.render( scene, camera );
    const axesHelper = new THREE.AxesHelper( 5 );
    scene.add( axesHelper );
    controls.update();
}

animate();